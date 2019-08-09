# Alert widgets

It's important to notify user when a change is going to be made or an error has appeared. You can create new customizable widgets on any panel element when its value is going to be changed.

To create a widget, you have to add two json properties on the json of the element whose value is being modified: 'confirmation' and 'confirmationWidget'.

    paint: {
        type: 'button',
        tooltip: 'paint',
        classed: 'ez3d-button fa-paint-brush',
        confirmation: true,
        confirmationWidget: {
            'name': 'color-palette-selector-building',
            'title': 'colorPaletteSelector',
            'functionOnCreation': ['colorPaletteWidget', 'building']
            'eventCancel': ['close_widget_notification', ''],
        }
    }

The 'confirmation' property is a boolean that determines if the widget will be shown or not. It can be a raw value (true/false) or a function that returns a boolean value.

The 'confirmationWidget' property is an object composed of:

    confirmationWidget: {
        'name': widget id,
        'title': title displayed on the header,
        'content': string with the content of the widget
        'functionOnCreation': function with a json of the elements to create in the widget content container
        'eventOk': [optional] the changes will be applied
        'eventCancel': [optional] the changed value won't be applied and the panels will update
    }

If the widget is going to be only informative, there must be an 'eventOk' property so that the changes are applied.

> Notice that both 'content' and 'functionOnCreation' properties create the content of the widget but in different ways, therefore you can only use one of these.

<div class="page-break"></div>

# Progress bar customization

The progress bar is managed by events. It has 4 listeners:

* showProgressBar
* resetProgressBar
* updateProgressBar
* hideProgressBar

Resetting the progress bar will remove its width and set the bar animation. We recommend you to emit this event before updating the progress bar with a value.

To update the progress bar it is important to first open it by emitting the event 'showProgressBar'. The values will be sent as an object this way:

    ee.emitEvent('updateProgressBar', [{
        title: 'Title of the operation'
        label1: 'Name of function',
        label2 : 'Step withing the function',
        value: 50
    }]);

There are some cases that need to be mentioned when sending these parameters:

* If 'title' is undefined, it will keep its last value. If it's different than the current one, the progress bar will reset
* If 'label1' is undefined, it will keep its last value. If title has changed, it won't have a value
* If 'label2' is undefined it won't have a value
* If 'value' is undefined it will be displayed the animation in the bar. Otherwise, it's value will be added to the width of the bar.

> The simplest example is generating all the textures. If the project has 3 bulidings, you will have to divide 100 by number of buildings, so that the bar width will increase a 33.3% each time the event is emitted.

When the progress bar is being hidden, all of its texts are removed and the animation is shown.

<div class="page-break"></div>

# Custom panels

You can customize all of the panels by changing their content.

There is a function in the API called setCustomPanel that receives as parameter a json that contains the panel info, content, functions and listeners.

To create a new panel, the panel elements must be in a 'json' property and a 'populate' property must be valued with 'updatePanel'.

    var newPanel = {
        name: 'panel-name',
        model: 'EZModelKeepout',
        customMethods: {},
        customGuiMethods: {},
        customListeners: {},
        json: {
            name: {
                type: 'string',
                property: 'name',
                label: 'keepout_name',
                value: this.name
            }
        },
        populate: 'updatePanel'
    }

To create a group of panels, they have to be declared as customMethods:

    var keepoutPanels = {
        name: 'custom-keepouts-panels',
        model: 'EZModelKeepout',
        customMethods: {
            keepoutCreate: customKeepoutCreatePanel,
            keepoutEdit: customKeepoutEditPanel,
            keepoutInfo: customKeepoutInfoPanel
        },
        customGuiMethods: {}
    };

These panels are also jsons that define the content of each panel by blocks.

> Please, visit the section [Panel blocks](#panel-blocks) to learn how to create different blocks in panels.

<div class="page-break"></div>

CustomMethods are functions that extend the given model (for example, EZModelKeepout). For executing these, you have to use the runMethod operator in an eventOnClick/eventOnChange property:

    eventOnChange: ['EZModelKeepout_runMethodListener', 'nameOfTheCustomMethod']

CustomGUIMethod will be executed directly in a functionOnClick/functionOnChange giving arguments as a second paramenter:

    functionOnClick: ['nameOfTheGUIMethod', argument],

CustomListeners define which event are listening to, and which customGUIMethod will run:

    nameOfProperty: ['eventToListen', 'nameOfTheGUIMethod']

## Panel blocks

To create different blocks, each element must have a 'type' property. These are the available types:

- string
- float / integer
- boolean
- select
- selectByImage
- selectBySVGImage
- azimuthRange
- helper
- link
- groupBlock
- button
- listResume
- blockList
- foldableBlock
- subareaBlock
- blockResume
- title
- compass
- invisibleKeepout
- stringWidget
- selectWidget
- buttonsPanelWidget
- buttonWidget
- rangeWidget
- dateTimeWidget
- booleanWidget
- imageNavigator
- navigator

# Layout Rules

The user can customize many options in the 3DLayout. By passing a 'rules' attribute to the 3DLayout instance with a collection of objects, you can define the default values, add special behaviours to the 3DLayout and customize the interface.

Example of rules object:

    var rules = {
        'display': true,
        'zoom': 21,
        'logo': false,
        'CustomPalette': ['#ff0000', '#00ff00']
    }

Available rule objects expected by the 3DLayout:

* Scene preferences
    * Project
    * Development
    * 3D canvas
    * Model
    * GUI
* Default buttons
* Default languages
* Default colors
    * Css colors
    * Building and roof colors
    * Keepout colors
    * Area colors
    * Dilatation lines colors
    * Module colors
    * Tree colors
    * Custom colors
* Default modules
* Default providers
* Default model values
    * Default model area values
    * Default model building values
    * Default model keepout values
    * Default model roof by type values
    * Default model roof values
    * Default model subarea by roof type values
    * Default model subarea values
    * Default model tree values

<div class="page-break"></div>

## Scene preferences

### Project

The attributes are:

    {
        defaultProjectId: crm project to load if there's no hash (set to 0 to load the demo version),
        loadMockup: if true it loads a mockup,
        userToken: user token
    }

### Development

All the attributes are boolean:

    {
        debugPromises: debug promises (console log),
        disableUndoRedo: disable undo/redo feature (WIP),
        enableApi: enable Api feature,
        snapShotCrm: allow snapshots to be sent to crm,
        debugListeners: debug number of listeners in console.log,
        debugOpTime: shows the time an operation takes to be done,
        recordOperators: record all the executed operators with their args
        debugContainers: show or ignore console.logs in code
        showOldSystemProject: show old drawing in svgProject container
        showOldSystemArea: show old drawing in svgArea container
        showNewSystemProject: show new drawing in svgProject container
        showNewSystemArea: show new drawing in svgArea container
    }

### 3D canvas

Sample values:

    {
        activeMapper: true,
        activeRenderer: true,
        buildingTextures: true,
        zoomRatio: 1,
        translationRatio: 1,
        rotationRatio: 1,   
        enablePlayer: true,
        customDateTime: false,
        defaultDateTime: '2019-01-01T10:00'
    }

The attributes are:

    {
        activeMapper: activate mapper on start,
        activeRenderer: activate renderer on start,
        buildingTextures: generate building textures when creating a building,
        zoomRatio: zoom ratio for 3D mode,
        translationRatio: translation ratio for 3D mode,
        rotationRatio: rotation ratio for 3D mode,
        enablePlayer: enable three.js canvas,
        customDateTime: enable custom date time for sun simulation,
        defaultDateTime: date time for sun simulation (customDateTime must be true, or defaultDateTime will be calculated depending on hemisphere)
    }

### Model

Sample values:

    {
        collisionBias: 0.03,
        angleBias: 0.5,
        maxAreaInclination: 75,
        sunSpeed: 3,
        googleApiKey: '',
        bingApiKey: '',
        maxDistanceFromCenter: 1000
        includeInsetInDL: false
    }

The attributes are:

    {
        collisionBias: factor to validate collisions (with bigger values less collision),
        angleBias: factor to validate regular angles (with bigger values less angle precision),
        maxAreaInclination: area is disabled when the area inclination is bigger than this value,
        sunSpeed: position of element of the sun simulator speed,
        googleApiKey: Google api key for provider,
        bingApiKey: Bing api key for provider,
        maxDistanceFromCenter: max distance in meters allowed from the first drawn building vertex to the project center
        includeInsetInDL: include inset in DL height and width
    }

### GUI

Sample values:

    {
        closeRightCanvas: true,
        showCoordinates: false,
        showTotalPower: true,
        customLogo: 'default',
        customNav: 'default',
        showNav: true,
        showLogo: true,
        defaultLanguage: 'en',
        defaultUnits: 'm',
        enableNotifications: true,
        manageFullscreen: true,
        movementStep: 0.1,
        snapToGrid: false,
        gridSize: 1,
        gridOffsetX: 0,
        gridOffsetY: 0,
        snapToGuides: true,
        snapToLines: true,
        snapToVertices: false,
        maxAllowedBuildings: 0,
        viewportMode: 4,
        customRowOffset: true,
        customRowOrientation: true,
        hidden: []
    }

The attributes are:

    {
        closeRightCanvas: close right canvas on start,
        showCoordinates: show coordinates of the mouse in the right bottom corner,
        showTotalPower: show 'Total power' indicator in the left upper corner,
        customLogo: custom logo url,
        customNav: show or hide nav ('default' shows nav),
        showNav: creates structure of panels,
        showLogo: show logo,
        defaultLanguage: string from available keys at 'defaultLanguages',
        defaultUnits: string from available keys at 'units',
        enableNotifications: enable operator notifications feature,
        manageFullscreen: manage fullscreen mode,
        movementStep: amount of movement in meters when using arrow keys to move solar panels,
        snapToGrid: enable snap vertices to grid,
        gridSize: grid distance to use as snap when using snap to move vertices,
        gridOffsetX: offset grid drawing in x axis,
        gridOffsetY: offset grid drawing in y axis,
        snapToGuides: activate snap to guides,
        snapToLines: enable snap to guidelines or edges,
        snapToVertices: enable snap to vertices or guideline intersections,
        maxAllowedBuildings: hides the button to create new buildings when their quantity is >= to this value (if it's 0 there is no max quantity),
        viewportMode: viewport mode,
        customRowOffset: enable custom row offset (right click on modules),
        customRowOrientation: enable custom row orientation (right click on modules),
        hidden: array of json properties within that json that don't want to be shown in panels
    }

The viewportMode options are:
* 0: invisible interface
* 1: showcase mode
* 2: open street map
* 3: hide interface [DEPRECATED]
* 4: google streetview
* 5: default values editor
* 6: simple mode
* 7: documentation
* 8: autocad export

<div class="page-break"></div>

## Default buttons

There are several areas in the 3DLayout where the user can add his own functions. The defaultButtons property has different properties depending on the area of the buttons:

    {
        buttonsPanelLeft: { },
        buttonsPanelRight: { },
        buttonsPanelBottomZoom: { },
        buttonsPanelBottomRight: { },
        buttonsPanelBottomLeft: { },
        buttonsPanelBottomCenter: { },
        buttonsPanelRightViewportRight: { }
    }

Each buttons panel has the following properties:

    buttonsPanelRight: {
        position: 'right',
        buttonsPanel: {
            type: 'groupBlock',
            elements: { }
        }
    }

To create a button panel you must specify its type ('groupBlock').

The 'elements' property within 'buttonsPanel' contains all the buttons that exist in that button panel. For example, to create the 'Snapshot' and 'Fullscreen' buttons at the right-top of the canvas:

    elements: {
        classed: 'ez3d-panel-buttons ez3d-flex-start-wrap-row viewport_left_controls_left',
        snapshot: {
            type: 'button',
            tooltip: 'snapshot',
            classed: 'ez3d-button fa-camera-retro',
            confirmation: true,
            confirmationWidget: {
                'name': 'snapshot',
                'title': 'snapShot',
                'functionOnCreation': ['managerWidgetSnapShot', 'snapshot']
            }
        },
        fullScreen: {
            type: 'button',
            tooltip: 'fullScreen',
            classed: 'ez3d-button ez3d-screen-icon',
            changeIcon: 'screen',
            functionOnClick: ['fullScreen', '']
        },
    }

The 'elements' property is composed of a 'classed' property to position the buttons, and the buttons by their name.

All the properties that a button can have are:

    buttonName: {
        type: 'button',
        id: button id,
        classed: class button attribute,
        content: button text,
        tooltip: button tooltip,
        property: attribute only model,
        confirmation: boolean for showing a button confirmation widget,
        confirmationWidget: {
            'eventOk': event sent when clicking on the 'Ok' button,
            'eventCancel': event sent when clicking on the 'Cancel' button,
            'name': widget id,
            'title': widget title,
            'content': widget content,
            'functionOnCreation': function called when creating the widget
        }
        value: button value,
        changeIcon: toggle button icon string,
        editable: disabled button attribute,
        active: active button class,
        elements: foldable elements list (object),
        functionOnClick: function called when clicking on the button,
        eventOnClick: event sent when clicking on the button
    }

It is very important to specify the type of element (in this case 'button') for creating correctly these elements.

These buttons will be created following the order of the 'buttonsPanel.elements' object.

<div class="page-break"></div>

## Default languages

To customize the existing languages or add new ones, you have to edit them or create a new json property with the name of that language abbreviation ('EN', 'FR', 'ES', etc).

    var defaultLanguages = {
        'EN': {
            'key': 'english key value'
        },
        'FR': {
            'key': 'french key value'
        }
    }

## Default colors

All the customizable colors can be also edited in the Preferences menu selecting the 'Default values editor' on the viewport mode. These are:

    var defaultColors = {
        cssColors: { },
        buildingColors: { },
        roofPointsColors: { },
        roofRidgeColors: { },
        keepoutColors: { },
        areaColors: { },
        subareaColors: { },
        dilatationLinesColors: { },
        moduleColors: { },
        treeColors: { },
        customColor: { }
    }

### Css colors

These colors are used in the viewport and buttons in the canvas areas.

    cssColors: {
        first: '#7AAD37',
        second: '#222960',
        third: '#E68A14',
        lightgray: '#DDDCE6',
        mediumgray: '#A7A3BC',
        darkgray: '#999',
        disabledbuttons: '#808080',
        disabledCustomSwtch: '#e0dfe4',
        primaryFont: '#ff0000',
        white: '#ffffff',
    }

### Building and roof colors

Building and roof colors have the same main attributes:

    {
        fill: '#a52a2a',
        fillOpacity: 0.1,
        stroke: '#000',
        strokeWidth: 0.4,
        strokeDasharray: 0
    }

These attributes can belong to different properties. For example 'standard', 'hover', 'active', 'vertices', etc.

> Note that every time it appears an empty object ({ }) in the examples, these main attributes exist in them.

    buildingColors: {
        path: {
            standard: {
                fill: '#a52a2a',
                fillOpacity: 0.1,
                stroke: '#000',
                strokeWidth: 0.4,
                strokeDasharray: 0
            },
            hover: { },
            active: { },
            roofContext: { },
            move: { }
        },
        vertices: {
            standard: { }
        },
        center: { },
        autocad: { }
    }

<div class="page-break"></div>

Also, in 'roofPointsColors' and 'roofRidgeColors' properties there's a new property called 'radius' on each property.

    roofPointsColors: {
        standard: {
            fill: '#008000',
            fillOpacity: 1,
            stroke: '#fff',
            strokeWidth: 0,
            strokeDasharray: 0,
            radius: 3
        },
        locked: { }
    },
    roofRidgeColors: {
        path: {
            standard: { }
        }
    }

### Keepout colors

In keepout colors property there are two new properties called 'offsettedPath' and 'autocad':

    keepoutColors: {
        path: {
            standard: { },
            active: { },
            hover: { },
            move: { },
            offsettedPath: { }
        },
        autocad: { }

<div class="page-break"></div>

### Area colors

Areas and subareas have the same properties except for 'autocad' property, which is only available in areaColors.

    areaColors: {
        path: {
            standard: { },
            active: { },
            move: { },
            hover: { },
            offsettedPath: { },
        },
        vertices: {
            standard: { },
            move: { }
        },
        autocad: {
            fill: 'transparent',
            fillOpacity: 1,
            stroke: '#ff3047',
            strokeWidth: 0.3,
            strokeDasharray: 0,
            strokeLine: '#6fff6d',
            strokeWidthLine: 0.02
        }
    },

### Dilatation lines colors

Sample values:

    dilatationLinesColors: {
        cols: {
            stroke: '#ffa500'
        },
        rows: {
            stroke: '#00ffff'
        }
    }

<div class="page-break"></div>

### Module colors

Properties for module colors:

    moduleColors: {
        path: {
            module: { },
            moduleSelected: { },
            moduleHover: { },
            empty: { },
            emptyHover: { },
            collision: { }
        },
        autocad: { }
    },

### Tree colors

Properties for tree colors:

    treeColors: {
        standard: { },
        active: { },
        hover: { }
    }

### Custom colors

Sample values:

    customColor: [
        '#0000FF', '#a52a2a', '#ff0000', '#1f77b4', '#aec7e8', '#ff7f0e',
        '#ffbb78', '#2ca02c', '#98df8a', '#d62728', '#ff9896', '#9467bd',
        '#c5b0d5', '#8c564b', '#c49c94', '#e377c2', '#f7b6d2', '#7f7f7f',
        '#c7c7c7', '#bcbd22', '#dbdb8d', '#17becf', '#9edae5'
    ]

<div class="page-break"></div>

## Default modules

The defaultModules variable is an array of objects with the modules information:

    var defaultModules = [
        {
            id: 47113,
            name: 'BenQ',
            reference: '327Wp Mono Zwart',
            power: 327,
            length: 1.559,
            width: 1.046,
            height: 0.046
        }

## Default providers

The defaultProviders variable is an array of strings with the providers names:

    var defaultProviders = ['White Map', 'Google Hybrid', 'Bing', 'Carto', 'Open Street Maps'];

## Default model values

The defaultModelValues property is an object with the following properties:

    var defaultModelValues = {
        area: areaDefaultValues,
        building: buildingDefaultValues,
        keepout: keepoutDefaultValues,
        roofByType: roofByTypeDefaultValues,
        roof: roofDefaultValues,
        subareaByRoofType: subareaByRoofTypeDefaultValues,
        subarea: subareaDefaultValues,
        tree: treeDefaultValues
    }

### Default model area values

Sample values:

    var areaDefaultValues = {
        disabled: false,
        populated: true
    }

<div class="page-break"></div>

### Default model building values

Sample values:

    var buildingDefaultValues = {
        overlapping: true,
        name: ' ',
        height: 10,
        maxHeight: Infinity,
        minHeight: 0,
        offset: [0],
        padding: {
            eaves: false,
            parapet: 0,
            height: 0
        },
        populated: true,
        regular: true,
        ridge: {
            enabled: false
        },
        hidden: [ ]
    }

### Default model keepout values

Sample values:

    var keepoutDefaultValues = {
        crop: false,
        height: 1,
        invisible: false,
        offset: [0],
        regular: true,
        type: 'vertical',
        hidden: [ ]
    }

<div class="page-break"></div>

### Default model roof by type values

Sample values:

    var roofByTypeDefaultValues = {
        flat: {
            material: 'bitumen',
            availableMaterial: {
                gravel: {
                    value: 'gravel',
                    image: 'gravel',
                    label: 'gravel'
                },
                bitumen: { },
                membrane: { },
                concrete: { }
            },
            availableOrientation: [ ],
            inclination: 0,
            offset: [1],
            orientation: '',
            hidden: [ ],
            locked: [ ]
        },
        gabled: { },
        hipped: { },
        pyramid { },
        mansard { },
        pent: {
            material: 'tiled',
            availableMaterial: [
                'tiled',
                'trapezoidal',
                'corrugated'
            ],
            offset: [0.4],
            orientation: 'S',
            availableOrientation: ['E', 'W', 'N', 'S'],
            inclination: 30,
            hidden: [ ],
            locked: [ ]
        }
    }

<div class="page-break"></div>

### Default model roof values

Sample values:

    var roofDefaultValues = {
        disabled: false,
        inclination: 0,
        lockRoofPoints: false,
        roofPointsSymmetry: true,
        material: 'bitumen',
        offset: [0],
        orientation: 'SN',
        type: 'flat',
        hidden: [ ]
    }

### Default model subarea by roof type values

Sample values:

    var subareaByRoofTypeDefaultValues = {
        flat: {
            modelId: 471131,
            azimuth: '',
            inset: {x: 0.025, y: 0.025},
            inclination: 15,
            useShadowsCalculation: false,
            availableInclination: '',
            placement: 'landscape',
            availablePlacement: ['landscape','portrait'],
            structure: 'Standard',
            availableStructure: ['EW','Standard'],
            staggered: {
                enabled: false,
                offset: 0,
                offsetMax: 3,
                alternate: false
            },
            dilatationLines: {
                enabled: false,
                x: 30,
                y: 30,
                w: 0.35,
                h: 0.1
            }
        },
        pent: { },
        gabled: { },
        hipped: { },
        pyramid: { },
        mansard: { }
    }

### Default model subarea values

Sample values:

    var subareaDefaultValues = {
        crop: false,
        disabled: false,
        offset: [0],
        regular: true,
        hidden: [ ]
    }

### Default model tree values

Sample values:

    var treeDefaultValues = {
        disabled: false,
        crownTopHeight: 10,
        crownHigherHeight: 7,
        crownHigherRadius: 1.42,
        crownMiddleHeight: 5,
        crownMiddleRadius: 1.75,
        crownLowerHeight: 3.5,
        crownLowerRadius: 1.42,
        trunkHeight: 2.5,
        trunkRadius: 0.33,
        hidden: [ ]
    }
