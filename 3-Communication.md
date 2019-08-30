# 3DLayout Communication System

## Info Events sent by 3DLayout

The 3DLayout triggers different events to report actions when they are accomplished or to inform on GUI changes.

Here is an example of how to listen to these events:

    var container = window.document.getElementById('ezzing3d');

    container.addEventListener('buildingSelected', function(event, data){
        console.log(event.detail);
    });

The full list of events emmited by the 3DLayout are:

Active changed: triggered every time the user activates this object or enters its edit section. The event sends the **object.id**.
* Building: activeBuilding, editBuilding
* Area: activeArea, editArea
* Subarea: activeSubarea, editSubarea, resetSubarea
* Tree: activeTree, editTree
* Keepout: activeKeepout, editKeepout


Finish creation: triggered every time a one of the following objects is created. The event sends the **object.id**.
* buildingCreated
* subareaCreated
* keepoutCreated

Edit points: triggered every time the user enters the vertices/roof edit section of a building. The event sends the **building.id**).
* editVertices
* editRoof
* editRoofFinished

Close panel:
* editSubareaFinished

Set attribute changed: triggered every time any of these objects attribute is changed. The event sends back an array with **[object.id, attribute, value]**.
* buildingChanged
* areaChanged
* subareaChanged
* treeChanged
* keepoutChanged
* roofChanged
* sceneChanged

Delete object: triggered every time any of these objects is deleted. The event sends the **object.id** (after this operation this object won't longer exist in the project).
* buildingRemoved
* areaRemoved
* subareaRemoved
* treeRemoved
* keepoutRemoved

Change tab: triggered every time the aside panel navigation tab changes. It sends a string with the current tab name ('building', 'areas', 'keepouts', 'trees', 'keepout-info' or 'tree-info').
* tabChangedApi

Save project:
* layoutProjectSaved

Clone:
* buildingCloned
* areaCloned
* subareaCloned
* treeCloned
* keepoutCloned

Move points:
* locationChanged

Edit subarea:
* editSubareaPath

Move subarea:
* subareaMoved

Move system finished:
* modulesMoved

Delete subarea:
* subareaRemoved

Fullscreen enabled/disabled: triggered when the user changes from normal view to fullscreen. It sends **true** when changing to fullscreen and **false** when disabling it mode.
* ez3d-fullscreen-disabled
* ez3d-fullscreen-enabled

Lock interface:
* lockInterface

Invalid offset:
* invalidOffset

Undo/Redo panels: triggered when a customProperty has been changed sending the panel name.
* changePanelOnUndoRedo

Undo/Redo executed: triggered every time a undo or redo operation has been executed.
* executedUndoRedo

## Functions to retrieve info from 3DLayout

There is a set of functions to retrieve information from the 3DLayout.

For all these functions you can send a callback as an argument to be executed when data is retrieved.

### General functions

* saveProject(callback)
* refreshViewport

### Panels functions

* setCustomPanel(customPanelData, callback): creates a new panel
* setUnits(unitToChange, callback): set a new unit (m, cm, mm, ...)

### Buildings functions

Set of functions to retrieve buildings information from the layout. The **callback** argument is always needed.

#### getCurrentBuildingId(callback)

Returns the id of the current active building.

#### getLayoutData(callback)

Returns a JSON with an array of buildings:

    {
        id: building id,
        name: building name,
        areas: {
            id: area id,
            name: area name,
            subareas: {
                id: subarea id,
                name: subarea name
            }
        }
    }

#### getBuildingInfo(id, callback)

Returns all the building information for a given building.id:

    {
        id: the building id,
        name: the building name,
        height: building height (in meters),
        regular: true if building angles are all equal to 90º, false otherwise.
        buildingArea: building area measure (in square meters),
        centerDeg: building center in World coordinate system,
        centerMCoords: building center in Scene coordinate system,
        vertices: building vertices in world coordinate system  [DEPRECATED],
        verticesMCoords: building vertices in building coordinate system,
        modules: total of modules in the building
        power: total power of the building,
        areas: {
            id: the area id,
            name: the area name,
            subareas: {
                id: the subarea id,
                name: the subarea name
            }
        }
    }

#### getRoofsInfo(id, callback)

Returns roof information for a given building.id:

    {
        height: roof height (in meters, not including building height),
        inclination: roof angle (in degrees),
        material: roof material (i.e: tiled/corugated),
        orientation: roof orientation (i.e: east/west or nort/south),
        type: roof type (i.e: flat, pent, gabled, etc...)
    }

#### getBuildingPosition(id, callback)

Returns building position info for a given building.id:

    {
        center: building center in world coord system [DEPRECATED],
        vertices: array of building vertices, world coord system [DEPRECATED],
        centerDeg: building center in World coord system,
        centerMCoords: building center in Scene coord system,
        verticesMCoords: building vertices in building coord system,
    }

#### getNumberOfModules(callback)

Returns a JSON with an array of buildings with the following properties:

    {
        id: building id,
        name: building name,
        modules: total of modules in the building,
        areas: {
            id: area id,
            name: area name,
            modules: total of modules in the area,
            subareas: {
                id: subarea id,
                name: subarea name,
                modules: total of modules in the subarea
            }
        }
    }

#### getTotalPower(callback)

Returns the total power for all the buildings in the project.

#### getPower(callback)

Returns an array of all buildings in the project with the following properties:

    {
        id: the building id,
        name: the building name,
        power: the total power for this building,
        areas: {
            id: the area id,
            name: the area name,
            power: total power in this area,
            subareas: {
                id: the subarea id,
                name: the subarea name,
                power: total power in this subarea
            }
        }
    }

### Areas functions

Set of generic functions to retrieve Area related information from the layout. In this set of functions you should pass an existing area id and a callback.

* getAreaInfo
* getAreaOffset

#### getAreaInfo(id, callback)

Returns area info for a given area.id:

    {
        id: area id,
        name: area name,
        offset: area offset,
        placement: placement (ex: portrait/landscape),
        structure: (ex: east-west/standard),
        inclination: modules inclination (in degrees),
        azimuth: modules azimuth inclination (in degrees),
        areaMCoords: array with area vertices coordinates in Area system coords [DEPRECATED],
        areaOffsetMCoords: array with offseted area vertices in Area system coords [DEPRECATED],
        verticesMCoords: array with area vertices coordinates in Area system coords,
        verticesOffsetMCoords: array with offseted area vertices in Area system coords,
        wallSizes: size in meters for each area wall,
        wallAzimuth: azimuthal angle for the external area wall,
        power: total power of the area,
        subareas: {
            id: subarea id,
            name: subarea name
        }
    }

#### getAreaOffset(id, offset, callback)

Returns an array of vertices containing the offseted area for a given area.id and offset.

If the offset is a negative value, then the area is reduced by the offset value (in meters).

### Subarea functions

Set of generic functions to retrieve area related information from the layout. In this set of functions you should pass an existing area id and a callback.

* getSubareaInfo
* getModuleInfoBySubarea
* getModulesStructureBySubarea

#### getSubareaInfo(id, callback)

Returns subarea info for a given subarea.id:

    {
        id: subarea id,
        name: subarea name,
        offset: subarea offset,
        placement: placement (ex: portrait/landscape),
        structure: (ex: east-west/standard),
        inclination: modules inclination (in degrees),
        azimuth: modules azimuth inclination (in degrees),
        verticesMCoords: array with subarea vertices coordinates in Area system coords,
        verticesOffsetMCoords: array with offseted subarea vertices in Area system coords,
        wallSizes: size in meters for each subarea wall,
        wallAzimuth: azimuthal angle for the external area wall,
        power: total power of the subarea,
    }

#### getModuleInfoBySubarea(id, callback)

Returns module info for a given subarea.id:

    {
        id: module id,
        name: module model name,
        reference: extra model information,
        width: width of the module (in meters),
        height: height of the module (in meters),
        length: lenght of the module (in meters),
        power: power of the module
    }

#### getModulesStructureBySubarea(id, callback)

Returns a JSON with an array of modules for a given subarea.id:

    {
        x: x position of the module in Area system coords,
        y: y position of the module in Area system coords,
        col: column to which the module belongs,
        row: row to which the module belongs,,
        rX: rotation of the module in the X axis (inclination),
        rZ: rotation of the module in the Z axis (azimuth),
        color: color of the module (only exist if color is not default),
    }

## Functions to send info to the 3DLayout

Set of functions to change values inside the project:

* setAttribute(objectId, attr, value, callback)
* updateRender
* setActive(objectId, callback)
* disabledMap(callback)
* cleanResult(list)

<div class="page-break"></div>
