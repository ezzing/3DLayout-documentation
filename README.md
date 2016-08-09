ezzing3DLayout
==============

PV planning tool - API Documentation
------------------------------------

<img src="./doc_templates/portada.jpg" alt="ezzing3DLayout Documentation" id="cover" class="w100" />

Table of contents
=================

-   [Introduction](#introduction)
-   [Screenshots](#screenshots)
-   [3DLayout Interface](#dlayout-interface)
    -   [Aside Panel](#aside-panel)
    -   [Canvas Area](#canvas-area)
        -   [Buildings Index](#buildings-index)
        -   [Main Options](#main-options)
        -   [Control Buttons](#control-buttons)
-   [Integration in a non-angular platform](#integration-in-a-non-angular-platform)
    -   [HTML code](#html-code)
        -   [DOM header](#dom-header)
        -   [DOM body](#dom-body)
    -   [Javascript code](#javascript-code)
-   [3DLayout Communication System](#dlayout-communication-system)
    -   [Info Events sent by 3DLayout](#info-events-sent-by-3dlayout)
        -   [load](#load)
        -   [zoomChanged](#zoomchanged)
        -   [fullscreen](#fullscreen)
        -   [tabChanged](#tabchanged)
        -   [editArea](#editarea)
        -   [editKeepout](#editkeepout)
        -   [editTree](#edittree)
        -   [areaChanged](#areachanged)
        -   [buildingChanged](#buildingchanged)
        -   [editRoof](#editroof)
        -   [editVertices](#editvertices)
        -   [buildingRemoved](#buildingremoved)
        -   [buildingSelected](#buildingselected)
        -   [buildingCreated](#buildingcreated)
    -   [Functions to retrieve info from 3DLayout](#functions-to-retrieve-info-from-3dlayout)
        -   [Generic Functions](#generic-functions)
        -   [Building related functions](#building-related-functions)
        -   [Area related functions](#area-related-functions)
-   [Layout Rules](#layout-rules)
    -   [Special Behaviours](#special-behaviours)
        -   [Display](#display)
        -   [zoom](#zoom)
        -   [logo](#logo)
    -   [Default Values](#default-values)
        -   [modules](#modules)
        -   [DefaultRoofs](#defaultroofs)
        -   [DefaultBuilding](#defaultbuilding)
        -   [CustomPalette](#custompalette)
    -   [Custom Buttons](#custom-buttons)
        -   [MainoptionsCustomButtons](#mainoptionscustombuttons)
        -   [ControlCustomButtons](#controlcustombuttons)

Introduction
============

Ezzing 3DLayout is a PV planning tool that allows you to generate a 3d model of a building based on a satellite image. You can model any number of buildings, select between up to five different type of roofs, define keepouts and trees with custom heights.

Inside each roof area you can customize different structures, select module models and get automated previews of your setup.

It also provides you with a perspective view and a sun simulator to determine where the shadows will be in your installation.

Ezzing 3DLayout is an embebible webapp. You can integrate it inside your own system and customize many elements inside, from module models to prefered default settings for each roof type.

In this document you will find a brief showcase of the different areas of the app, a technical explanation on how to integrate this webapp inside your platform, a full description of the API that will allow you to communicate with the 3DLayout, and finally a description on how to customize different parts of the app.

<img src="./layout-doc-imgs/intro-mac.jpg" alt="3DLayout" class="w100" />

Screenshots
===========

<img src="./layout-doc-imgs/perspective-view-mac.jpg" alt="perspective view" class="w100" />

<img src="./layout-doc-imgs/sun-simulation-mac.jpg" alt="sun simulation" class="w100" />

3DLayout Interface
==================

The 3DLayout interface has two diferent parts. The **aside panel** and the **canvas area**.

Aside Panel
-----------

In the aside panel you can find functionalities related to the current active building and other objects in the scene.

<img src="./layout-doc-imgs/tab-building-mac.jpg" alt="tab building" class="w100" />

<img src="./layout-doc-imgs/tab-areas-1-mac.jpg" alt="tab areas 1" class="w100" />
<img src="./layout-doc-imgs/tab-areas-2-mac.jpg" alt="tab areas 2" class="w100" />

<img src="./layout-doc-imgs/tab-keepouts-mac.jpg" alt="tab keepouts" class="w100" />
<img src="./layout-doc-imgs/tab-trees-mac.jpg" alt="tab trees" class="w100" />

Canvas Area
-----------

In the canvas area you can see the satellite view and three diferent sets of elements, the **buildings index** on the left side, the **main options buttons** on the top, and the **control buttons** on the bottom-right corner.

<img src="./layout-doc-imgs/canvas.jpg" alt="canvas" class="w100" />

### Buildings Index

In the buildings index you can see the active building and select another one to become active.

<img src="./layout-doc-imgs/buildings-index.jpg" alt="buildings-index" class="w200px" />

### Main Options

This are the main options in the canvas area.

<img src="./layout-doc-imgs/mainoptions.jpg" alt="mainoptions" class="w100" />

The three left-sided buttons are the **main options fixed buttons**:

-   redo
-   undo
-   save

The right aligned buttons are the **main options custom buttons**. You can customize this set of buttons by hidding some of them or by adding new buttons.

The default custom buttons are:

-   satellite provider selector (only showed if available)
-   snapshot
-   sun simulation
-   perspective view
-   fullscreen

> Please, visit the section [Custom Buttons](#custom-buttons) to learn how to add your own functions.

### Control Buttons

This are map related buttons. You can also customize the upper section of this set of buttons by hidding some of them or by adding new buttons

<img src="./layout-doc-imgs/controlbuttons.jpg" alt="controlbuttons" class="w100px" />

Fixed buttons in this area:

-   zoom in
-   zoom out

Default control custom buttons

-   search address
-   geolocation

> Please, visit the section [Custom Buttons](#custom-buttons) to learn how to add your own functions.

Integration in a non-angular platform
=====================================

To integrate the 3DLayout into your platform, you only need this five files

-   angular\_lib.js - include the angular library
-   ezzing3DApp.js - Integration tools (contains the ezzing3D constructor and API functions)
-   ezzing3D.js - contains the platform code.
-   lib.js - some other useful third party libraries
-   screen.css - contains the 3DLayout css styles

Copy this files into the desired path (i.e: public/ezzing3d/)

HTML code
---------

To embed the 3DLayout app into an html page, you only need to add some lines to the code.

### DOM header

Add this lines to the header element in your code:

    script(type="text/javascript" src="/path-to-ezzing3d-files/angular_lib.js")
    script(type="text/javascript" src="/path-to-ezzing3d-files/ezzing3DApp.js")
    script(type="text/javascript" src="/path-to-ezzing3d-files/ezzing3D.js")
    script(type="text/javascript" src="/path-to-ezzing3d-files/lib.js")
    link(rel="stylesheet" href="/path-to-ezzing3d-files/screen.css")

### DOM body

Add this lines to the body element in your code:

    <div id="layout">
        <ezzing3d id='ezzing3d' layoutRules='{"logo": false}'></ezzing3d>
    </div>

Javascript code
---------------

To instantiate the ezzing3D object and start the app you need to run this lines inside your javascript code:

    var container = window.document.getElementById('ezzing3d');
    var layout = new ezzing3D(container, {
            token: token,
            id: id,
            failURL: '#/fail',
            showcase: showcase
        });

The attributes for this constructor are:

-   **container**: the DOM element with id=‘ezzing3d’

-   **token**: the user token from the CRM

-   **id**: the CRM project id. This value can also be used to activate special modes in the 3DLayout. Use id=“demo” to run a 3DLayout demo with an empty project. Use id=“tutorial” to run an interactive tutorial. Use id=“landing” to view an special showcase demo project.

-   **failURL**: an alternative URL to redirect the user when token or id from CRM fails.

-   **showcase**: When this value is true the project is opened in a special showcase mode, without graphic interface and in a nice 3d view. This mode is read-only and the project can not be modified.

3DLayout Communication System
=============================

Info Events sent by 3DLayout
----------------------------

The 3DLayout trigger different events to report actions when they are accomplished or to inform on GUI changes.

-   load
-   zoomChanged
-   fullscreen
-   tabChanged
-   editArea
-   editKeepout
-   editTree
-   areaChanged
-   buildingChanged
-   editRoof
-   editVertices
-   buildingRemoved
-   buildingSelected
-   buildingCreated

### load

This event is triggered when the 3DLayout finish to load the project from the CRM

### zoomChanged

This event is triggered when the zoom is changed in the canvas. It sends the zoom level value.

### fullscreen

This event is triggered when the user changes from normal view to fullscreen. It sends **true** when changing to fullscreen and **false** when disabling fullscreen mode

### tabChanged

This event is triggerd each time the user changes the aside panel navigation tab. It sends a string with the current tab name, the values can be one of this: \[ “building”, “areas”, “keepouts”, “trees” \]

### editArea

This event is triggerd each time the user enters the edit section of an area. The event sends the **area.id**

### editKeepout

This event is triggerd each time the user enters the edit section of a keepout. The event sends the **keepout.id**

### editTree

This event is triggerd each time the user enters the edit section of a tree. The event sends the **tree.id**

### areaChanged

This event is triggerd each time an area is changed. The event sends the **area.id**

### buildingChanged

This event is triggerd each time a building is changed. The event sends the **building.id**

### editRoof

This event is triggerd each time the user enters the roof edit section of a building. The event sends the **building.id**

### editVertices

This event is triggerd each time the user enters the vertices edit section of a building. The event sends the **building.id**

### buildingRemoved

This event is triggerd each time a building is deleted. The event sends the **building.id** (after this operation this building no longer exist in the project)

### buildingSelected

This event is triggerd each time a new building becomes active. The event sends the **building.id**

### buildingCreated

This event is triggerd each time a new building is created. The event sends the **building.id**

Functions to retrieve info from 3DLayout
----------------------------------------

There are a set of functions to retrieve information from the 3DLayout.

For all these functions you can pass a callback as an argument to be executed when data is retrieved.

### Generic Functions

Set of generic functions to retrieve project information from the layout. You just need to pass the **callback**, no other arguments are needed.

-   getCurrentBuildingId
-   getLayoutData
-   getNumberOfModules
-   getTotalPower
-   getPower

#### getCurrentBuildingId

    layout.getCurrentBuildingId(callback);

This function returns the id value of the current active building.

#### getLayoutData

    layout.getLayoutData(callback);

This function returns a JSON with an array of buildings.

Each building in the array contains:

    {
        id: the building id, 
        name: the building name,
        areas: an array of areas in the building
    }

each area in the areas array contains:

    {
        id: the area id,
        name: the area name
    }

#### getNumberOfModules

    layout.getNumberOfModules(callback);

This function returns a JSON with an array of buildings.

Each building in the array contains:

    {
        id: the building id,
        name: the building name,
        number of modules: total of modules in the building
        areas: an array of areas in the building
    }

Each area in the areas array contains:

    {
        id: the area id,
        name: the area name,
        number of modules: total of modules in the area
    }

#### getTotalPower

    layout.getTotalPower(callback);

Returns the total power for all the buildings in the project

#### getPower

    layout.getPower(callback);

Returns an array of all buildings in the project

Each building in the array contains:

    {
        id: the building id,
        name: the building name, 
        power: the total power for this building,
        areas: array of areas in this building
    }

Each area in the areas array contains:

    {
        id: the area id,
        name: the area name,
        power: total power in this area
    }

### Building related functions

Set of generic functions to retrieve building related information from the layout.In this set of functions you should pass an existing building id, and a callback.

-   getBuildingInfo
-   getRoofInfo
-   getBuildingPosition

#### getBuildingInfo

    layout.getBuildingInfo(id, callback);

Returns some building information for a given building.id

The data returned is:

    {
        id: the building id, 
        name: the building name, 
        height: building height (in meters), 
        regular: true if building angles are all equal to 90º, false otherwise.
        buildingArea: building area measure (in square meters), 
        vertices: building vertices in lat/long coordinates,
        modules: total of modules in the building
        power: total power of the building, 
    }
        

#### getRoofInfo

    layout.getRoofInfo(id, callback);

Returns some roof information for a given building.id\]

The data returned is:

    {
        height: roof height (in meters, not including building height), 
        inclination: roof angle (in degrees), 
        material: roof material (i.e: tiled/corugated), 
        orientation: roof orientation (i.e: east/west or nort/south), 
        type: roof type (i.e: flat, pent, gabled, etc...)
    }

#### getBuildingPosition

    layout.getBuildingPosition(id, callback);

Returns some building position info for a given building.id

The data returned is:

    {
        center: the building center in lat/long coords
        vertices: an array of building vertices in lat/long coords
    }

### Area related functions

Set of generic functions to retrieve Area related information from the layout.In this set of functions you should pass an existing area id, and a callback.

-   getAreaInfo
-   getModuleInfoByArea
-   getModulesSructureByArea
-   getAreaOffset

#### getAreaInfo

    layout.getAreaInfo(id, callback);

returns some area info for a given area.id\]

The data returned is:

    {
        id: the area id,
        name: the area name,
        offset: the area offset,
        placement: placement (i.e: portrait / landscape),
        structure: i.e: east-west / standard,
        inclination: modules inclination (in degrees),
        azimuth: modules azimuthal inclination (in degrees),
        areaMCoords: array containing area vertices coordinates in meters (with origin in the building center),
        areaOffsetMCoords: array containing offseted area vertices coordinates in meters (with origin in the building center) ,
        wallSizes: size in meters for each area wall,
        wallAzimuth: azimuthal angle for the external area wall,
        power: total power of the area.
    }

#### getModuleInfoByArea

    layout.getModuleInfoByArea(id, callback);

returns some module info for a given area.id\]

The data returned is:

    {
        id: the module id, 
        name: the module model name, 
        reference: extra model information, 
        width: the width of the module (in meters),
        height: the height of the module (in meters), 
        length: the lenght of the module (in meters), 
        power: the power of the module
    } 

#### getModulesSructureByArea

    layout.getModulesSructureByArea(id, callback);

returns a JSON with an array of modules for a given area.id

The data for each module in the array is:

    {
        x: x position of the module in meters (with origin in the building center),
        y: y position of the module in meters (with origin in the building center),
        col: column to which the module belongs,
        row: row to which the module belongs,,
        rX: rotation of the module in the X axis (inclination),
        rZ: rotation of the module in the Z axis (azimuth),
        color: the color of the module (only exist if color is not default),
    }

#### getAreaOffset

    layout.getAreaOffset(id, offset, callback);

Returns an array of vertices containing the offseted area for a given area.id and offset

If the offset is a negative value, then the area is reduced by the offset value (in meters)

Layout Rules
============

The user can customize many options in the 3DLayout. By passing a ‘layoutRules’ attribute to the layout element with a collection of objects you can define the default values, add special behaviours to the 3DLayout and customize the interface.

Example of rules object:

    rules = {
        'display': true,
        'zoom': 21,
        'logo': false,
        'CustomPalette': ['#ff0000', '#00ff00']
    }

Available rule objects expected by the 3DLayout:

-   Special
    -   display
    -   zoom
    -   logo
-   Default Values
    -   modules
    -   DefaultRoofs
    -   DefaultBuilding
    -   CustomPalette
-   Custom Buttons
    -   MainoptionsCustomButtons
    -   ControlCustomButtons
    -   AsideCustomButtons

Special Behaviours
------------------

### Display

When this options is set to true, the project starts in perspective mode.

    {'display': true}

### zoom

You can set the starting zoom value. Zoom values use to range between 17 (far) to 24 (near).

    {'zoom': 21}

### logo

You can choose to show (true) or hide (false) the ezzingsolar logo from the top part of the aside panel.

    {'logo': true}

Default Values
--------------

User can define the default values for modules, buildings, roofs and even the color palete for modules.

### modules

User can define the solar modules available in the 3DLayout.

Sample values to define modules:

    {
        "modules": [
            {
                "id": 4410,
                "name": "Canadian Solar",
                "reference": "250Wp Polykristallijn",
                "power": 250,
                "length": 1.638,
                "width": 0.982,
                "height": 0.04
            }, {
                "id": 41403,
                "name": "Canadian Solar",
                "reference": "260WP All Black",
                "power": 260,
                "length": 1.638,
                "width": 0.982,
                "height": 0.04
            }
        ]
    }

The attributes for each module are:

    {
        id: a reference number (should be unique for each model)
        name: brand and model of the module
        reference: the reference of the model
        power: power generated by the module (in watts peak)
        lenght: lenght of the module (in meters)
        width: width of the module (in meters)
        height: height of the module (in meters)
    }

Note: the **id** value should be diferent for each module in the list.

### DefaultRoofs

User can define the default values for each roof type.

The 3DLayout currently has five available roof types: **flat**, **pent**, **gabled**, **hipped** and **pyramid**.

> Only roof types described in this objects are available to the user.

Sample values to define Default Roofs:

    {
        "DefaultRoofs": {
            'gabled': {
                //roof related
                "roofMaterial": "tiled",
                "availableRoofMaterial": ["tiled", "corrugated"],
                "orientation": "EW",
                "availableorientation": ["EW", "SN"],
                "roofInclination": 30,
                //area related
                "structure": "Standard",
                "availableStructures": ["Standard", "EW"],
                "offset": 0.4,
                "inset": {
                    "x": 0.02,
                    "y": 0.02
                },
                "azimuth": "",
                "moduleInclination": 0,
                "moduleType": "portrait",
                "availableModuleType": ["portrait", "landscape"],
                "locked": [],
                "hidden": []
            },
            'hipped': {
                //roof related
                "roofMaterial": "tiled",
                "availableRoofMaterial": ["tiled", "corrugated"],
                "orientation": "EW",
                "availableorientation": ["EW", "SN"],
                "roofInclination": 30,
                //area related
                "structure": "Standard",
                "availableStructures": ["Standard", "EW"],
                "offset": 0.4,
                "inset": {
                    "x": 0.02,
                    "y": 0.02
                },
                "azimuth": "",
                "moduleInclination": 0,
                "moduleType": "portrait",
                "availableModuleType": ["portrait", "landscape"],
                "locked": [],
                "hidden": []
            },
            'pyramid': {
                //roof related
                "roofMaterial": "tiled",
                "availableRoofMaterial": ["tiled", "corrugated"],
                "orientation": "",
                "availableorientation": [],
                "roofInclination": 30,
                //area related
                "structure": "Standard",
                "availableStructures": ["Standard", "EW"],
                "offset": 0.4,
                "inset": {
                    "x": 0.02,
                    "y": 0.02
                },
                "azimuth": "",
                "moduleInclination": 0,
                "moduleType": "portrait",
                "availableModuleType": ["portrait", "landscape"],
                "locked": [],
                "hidden": []
            },
            'pent': {
                //roof related
                "roofMaterial": "tiled",
                "availableRoofMaterial": ["tiled", "corrugated"],
                "orientation": "S",
                "availableorientation": ["E", "W", "N", "S"],
                "roofInclination": 30,
                //area related
                "structure": "Standard",
                "availableStructures": ["Standard", "EW"],
                "offset": 0.4,
                "inset": {
                    "x": 0.02,
                    "y": 0.02
                },
                "azimuth": "",
                "moduleInclination": 0,
                "moduleType": "portrait",
                "availableModuleType": ["portrait", "landscape"],
                "locked": [],
                "hidden": []
            },
            'flat': {
                //roof related
                "roofMaterial": "Bitum",
                "availableRoofMaterial": ["Bitum", "Concrete", "EPDM", "PVC"],
                "orientation": "",
                "availableorientation": [],
                "roofInclination": 0,
                //area related
                "structure": "EW",
                "availableStructures": ["EW", "Standard"],
                "offset": 1,
                "inset": {
                    "x": 0.02,
                    "y": 0.01
                },
                "azimuth": "",
                "moduleInclination": 10,
                "availableModuleInclination": [10, 15, 20],
                "moduleType": "landscape",
                "availableModuleType": ["portrait", "landscape"],
                "locked": [],
                "hidden": []
            },
        }
    }

Attributes explanation for default roof description

    {
        //roof related
        "roofMaterial": should be one from the availableRoofMaterial list,
        "availableRoofMaterial": array of strings with the roof material names,
        "orientation": should be one from the availableorientation list, it can be an empty string for flat types,
        "availableorientation": array of strings with the orientation names. ['EW', 'SN'] or ["E", "W", "N", "S"]
        "roofInclination": angle for the roof (in degrees),
        //area related
        "structure": should be one from the availableStructures list,
        "availableStructures": array of strings with the structure names ["EW", "Standard"],
        "offset": the distance to avoid from area borders (in meters),
        "inset": {
            "x": the distance between module borders in the x axis (in meters) ,
            "y":  the distance between module borders in the x axis (in meters)
        },
        "azimuth": angle between the module and the north pole, it can be set as an empty string to let the 3DLayout to calculate the angle according to the external wall of the area,
        "moduleInclination": default module inclination. if availableModuleInclination is an array, this value should match one of the options in the array,
        "availableModuleInclination": this value can be an array of integers to restrict the inclination to this values. It can also be defined as an empty string to ignore the restriction,
        "moduleType": should be one from the availableModuleType list,
        "availableModuleType": array of strings with the available module types (i.e ["landscape", "portrait"])
        "locked": array of strings with the area attributes that should be locked,
        "hidden": array of strings with the area attributes that should be hidden
    }

### DefaultBuilding

User can define the default building. This are the default values for each new created building.

Sample values to define default building:

    {
        "DefaultBuilding": {
            data: {
                height: 10,
                roof: {
                    type: 'gabled',
                    inclination: 30,
                    orientation: 'EW',
                    material: 'tiled'
                },
                vertices: [],
                areas: [],
                keepouts: []
            }
        }
    }

The attributes for the default building:

    {
        data: {
            height: default height of the building (in meters),
            roof: {
                type: roof type (one of the available types in the defaultRoofs object),
                inclination: angle for the roof (in degrees),
                orientation: orientation of the roof ridge ('EW' for east-west or 'NS' for  north-south orientation),
                material: material of the roof (one of the available materials in the defaultRoofs object),
            },
            vertices: []
            areas: [],
            keepouts: []
        }
    }

### CustomPalette

User can define a custom set of hexadecimal colors. This colors are used to define module colors.

To define your own color palette use this squeme:

    {
        "CustomPalette": [
            '#242345',
            '#000000',
            '#ff0000'
        ]
    }

Custom Buttons
--------------

There are several areas in the 3DLayout where the user can add his own functions. This areas are the **main options buttons** and the **control buttons**. Each one are defined in a JSON description that can be added to the layoutRules object.

When the user adds a new button, this is defined as a event emitter.
We use the fontawesome icons collection, so you can use it to define new buttons.

### MainoptionsCustomButtons

<img src="./layout-doc-imgs/mainoptions.jpg" alt="mainoptions" class="w100" />

The buttons aligned to the right are custom buttons. User can define new custom buttons in this area.

Here you can hide some existing buttoms, change the order of them and create new ones with the ability to trigger an event.

This is the default MainoptionsCustomButtons:

    {
        "MainoptionsCustomButtons": [
            {
                click: "snapshot()",
                tooltip: "takeSnapshot",
                class: "fa fa-fw fa-camera-retro"
            }, {
                click: "widgets.simulation.toggle()",
                tooltip: "sunSimulation",
                class: "fa fa-fw fa-sun-o"
            }, {
                click: "setCamera('orthographic')",
                hide: "display.camera.name === 'orthographic'",
                tooltip: "switchTo2D",
                class: "fa fa-fw fa-square-o"
            }, {
                click: "setCamera('perspective')",
                hide: "display.camera.name === 'perspective'",
                tooltip: "switchTo3D",
                class: "fa fa-fw fa-cube"
            },
            {
                click: "setScreen('full')",
                hide: "fullScreen",
                tooltip: "switch to full screen",
                class: "fa fa-fw fa-arrows-alt"
            }, {
                click: "setScreen('normal')",
                hide: "!fullScreen",
                tooltip: "cancel full screen",
                class: "fa fa-fw fa-desktop"
            }
        ]
    }

To customize this buttoms you can comment out the lines of the button you want to hide or extend the list by adding new objects with the same structure

    {
        click: a string with the event name you want to trigger,
        hide: a condition to hide the button (this value is optional),
        tooltip: a string with the operator description, to show as a tooltip,
        class: a fontawesome class to define the icon
    }

### ControlCustomButtons

<img src="./layout-doc-imgs/controlbuttons.jpg" alt="controlbuttons" class="w100px" />

The buttons over the zoom in and zoom out can be customized the same way the mainoptions custom buttons.

This is the default ControlCustomButtons:

    {    
        "ControlCustomButtons": [
            {
                click: 'widgets.geocoding.toggle()',
                tooltip: 'searchAddress',
                class: 'fa fa-fw fa-search'
            },
            {
                click: '!geolocating && geolocate()',
                hide: 'geolocating',
                tooltip: 'geolocation',
                class: 'fa fa-fw fa-map-marker'
            },
            {
                click: '!geolocating && geolocate()',
                hide: '!geolocating',
                tooltip: 'geolocation',
                class: 'fa fa-fw fa-spinner ng-class:{"fa-spin": geolocating}'
            }
        ]
    }

To customize this buttoms you can comment out the lines of the button you want to hide or extend the list by adding new objects with the same structure

    {
        click: a string with the event name you want to trigger,
        hide: a condition to hide the button (this value is optional),
        tooltip: a string with the operator description, to show as a tooltip,
        class: a fontawesome class to define the icon
    }
