<div class="page-break"></div>
# 3DLayout Communication System

## Info Events sent by 3DLayout

The 3DLayout trigger different events to report actions when they are accomplished or to inform on GUI changes.

An example on how to listen this events

    var container = window.document.getElementById('ezzing3d');

    container.addEventListener("buildingSelected", function(event, data){
        console.log(event.detail);
    });

The full list of events emmited by the 3DLayout are:

<!-- * load -->
* zoomChanged
* fullscreen
* tabChanged
* editArea
* editKeepout
* editTree
* areaChanged
* buildingChanged
* roofChanged
* editRoof
* editVertices
* buildingRemoved
* buildingSelected
* buildingCreated

<!--  
### load

This event is triggered when the 3DLayout finish to load the project from the CRM
-->

### zoomChanged

This event is triggered when the zoom is changed in the canvas. It sends the zoom level value.

### fullscreen

This event is triggered when the user changes from normal view to fullscreen. It sends **true** when changing to fullscreen and **false** when disabling fullscreen mode

### tabChanged

This event is triggerd each time the user changes the aside panel navigation tab. It sends a string with the current tab name, the values can be one of this: [ "building", "areas", "keepouts", "trees" ]

### editArea

This event is triggerd each time the user enters the edit section of an area. The event sends the **area.id**

### editKeepout

This event is triggerd each time the user enters the edit section of a keepout. The event sends the **keepout.id**

### editTree

This event is triggerd each time the user enters the edit section of a tree. The event sends the **tree.id**

### areaChanged

This event is triggerd each time an area attribute is changed. The event sends back an array with this info:

    [area.id, attribute, value]

### buildingChanged

This event is triggerd each time a building is changed. The event sends back an array with this info:

    [building.id, building attribute, value]

### roofChanged

This event is triggerd each time a roof attribute is changed. The event sends back an array with this info:

    [building.id, roof attribute, value]

### editRoof

This event is triggerd each time the user enters the  roof edit section of a building. The event sends the **building.id**

### editVertices

This event is triggerd each time the user enters the vertices edit section of a building. The event sends the **building.id**

### buildingRemoved

This event is triggerd each time a building is deleted. The event sends the **building.id** (after this operation this building no longer exist in the project)

### buildingSelected

This event is triggerd each time a new building becomes active. The event sends the **building.id**

### buildingCreated

This event is triggerd each time a new building is created. The event sends the **building.id**

## Functions to retrieve info from 3DLayout

There are a set of functions to retrieve information from the 3DLayout.

For all these functions you can pass a callback as an argument to be executed when data is retrieved.

### Generic Functions

Set of generic functions to retrieve project information from the layout. You just need to pass the **callback**, no other arguments are needed.

* getCurrentBuildingId
* getLayoutData
* getNumberOfModules
* getTotalPower
* getPower

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
        modules: total of modules in the building
        areas: an array of areas in the building
    }

Each area in the areas array contains:

    {
        id: the area id,
        name: the area name,
        modules: total of modules in the area
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

Set of generic functions to retrieve building related information from the layout. In this set of functions you should pass an existing building id, and a callback.

* getBuildingInfo
* getRoofInfo
* getBuildingPosition

#### getBuildingInfo

    layout.getBuildingInfo(id, callback);

Returns building information for a given building.id

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
        areas: array of areas in this building
    }

Each area in the areas array contains:

    {
        id: the area id,
        name: the area name
    }

#### getRoofInfo

    layout.getRoofInfo(id, callback);

Returns roof information for a given building.id]

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

Returns building position info for a given building.id

The data returned is:

    {
        center: the building center in lat/long coords
        vertices: an array of building vertices in lat/long coords
    }

### Area related functions

Set of generic functions to retrieve Area related information from the layout. In this set of functions you should pass an existing area id, and a callback.

* getAreaInfo
* getModuleInfoByArea
* getModulesSructureByArea
* getAreaOffset

#### getAreaInfo

    layout.getAreaInfo(id, callback);

returns area info for a given area.id]

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

returns module info for a given area.id]

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

<!-- ***
    Recordadme que tengo que automatizar el token de creación de objetos en la api
 -->

<!-- 
## Functions to set values in to the project

Set of functions to change values inside the project. There are two types:

* setAreaAttribute
* setBuildingAttribute

### setAreaAttribute

With this function you can change this area attributes:

* model
* placement
* structure
* inclination
* useShadowsCalculation
* inset.x
* inset.y
* totalInset.x
* totalInset.y
* offset
* azimuth

    var id = "aaa060bf-cae0-41b0-9fd2-c234262ea710";
    var field = "structure";
    var value = "Standard";

    scope.$emit("setAreaAttribute", [id, field, value]);
    scope.$emit("setAreaAttribute", [id, 'inclination', 45]);
    scope.$emit("setAreaAttribute", [id, 'inset.y', 0.0034]);
    scope.$emit("setAreaAttribute", [id, 'azimuth', 45]);

### setBuildingAttribute

With this function you can change this building fields

* name
* height
* roof.inclination
* roof.material


    var id = "64a1f446-a552-4aef-bed3-5268b62610a6";

    var value = 75;
    var field = "roof.inclination";
    scope.$emit("setBuildingAttribute", [id, field, value]);

    var value = 20;
    var field = "height";
    scope.$emit("setBuildingAttribute", [id, field, value]);
 -->