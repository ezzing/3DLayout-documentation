# Introduction

Ezzing 3DLayout is a PV planning tool that allows you to generate a 3d model of a building based on a satellite image. You can model any number of buildings, select between up to five different type of roofs, define keepouts and trees with custom heights...

Inside each roof area you can customize different structures, select module models and get automated previews of your setup.

It also provides you with a perspective view and a sun simulator to determine where the shadows will be in your installation.

Ezzing 3DLayout is an embebible webapp. You can integrate it inside your own system and customize many elements inside, from module models to prefered default settings for each roof type.

In this document you will find a brief showcase of the different areas of the app, a technical explanation on how to integrate this webapp inside your platform, a full description of the API that will allow you to communicate with the 3DLayout, and finally a description of how to customize different parts of the app.

<img class="w100" src="./layout-doc-imgs/general/intro.jpg" alt="3DLayout" />
<br>

You can test the app by visiting this link:

<a href="https://layout.ezzing.com/#/demo">https://layout.ezzing.com/#/demo</a></li>

<div class="page-break"></div>

# Screenshots

<img class="w100" src="./layout-doc-imgs/general/perspective-view.jpg" alt="Perspective view" />

<br><br>

<img class="w100" src="./layout-doc-imgs/general/sun-simulation.jpg" alt="Sun simulation" />

<div class="page-break"></div>

# 3DLayout Interface

The 3DLayout interface has two diferent parts: the **aside panel** and the **canvas area**.

## Aside Panel

In the aside panel you can find functionalities related to the current active building and other objects in the scene.

<br>

<img class="w100" src="./layout-doc-imgs/tabs/tab-building.jpg" alt="Tab building" />
<br><br>
<img class="w100" src="./layout-doc-imgs/tabs/tab-areas-1.jpg" alt="Tab areas 1" />
<br><br>
<img class="w100" src="./layout-doc-imgs/tabs/tab-areas-2.jpg" alt="Tab areas 2" />
<br><br>
<img class="w100" src="./layout-doc-imgs/tabs/tab-keepouts.jpg" alt="Tab keepouts" />
<br><br>
<img class="w100" src="./layout-doc-imgs/tabs/tab-trees.jpg" alt="Tab trees" />
<br><br>
<img class="w100" src="./layout-doc-imgs/tabs/tab-preferences.jpg" alt="Tab preferences" />

<div class="page-break"></div>

## Canvas Area

In the canvas area you can see the satellite view and three different sets of elements: the **buildings index** on the top-left side, the **main options buttons** on the top-right, and the **control buttons** on the bottom-right corner.

<img class="w100" src="./layout-doc-imgs/canvas/canvas.jpg" alt="Canvas" />

<div class="page-break"></div>

### Buildings Index

In the buildings index you can see the active building and select another one to become active. The color represented on each index is the color of the building.

<img class="w200px" src="./layout-doc-imgs/canvas/buildings-index.jpg" alt="Buildings index" />

### Main Options

These are the main options in the canvas area:

<img class="w100" src="./layout-doc-imgs/canvas/main-options.jpg" alt="Main options" />

All these buttons are the **main options custom buttons**. You can customize this set of buttons by hidding some of them, by sorting them, or by adding new buttons.

The default custom buttons are:

* Undo/Redo
* Save: saves the layout in crm
* Search address: moves the project center to the address specified
* Snapshot: takes a photograph of the project (with or without modules in jpg format, or in svg format)
* Fullscreen
* Sun simulation: sun and shadow simulation
* Perspective view: switches to 2D/3D view
* Renderer
* Satellite provider selector (only showed if available)

> Please, visit the section [Custom Buttons](#custom-buttons) to learn how to add your own buttons.

<div class="page-break"></div>

### Control Buttons

These are map related buttons. You can also customize the upper section of this set of buttons by hidding some of them or by adding new buttons.

<img class="w75px" src="./layout-doc-imgs/canvas/control-buttons-1.png" alt="Control buttons 1" />

Fixed buttons in this area:

* Zoom in
* Zoom out

<br>

<img class="w75px" src="./layout-doc-imgs/canvas/control-buttons-2.png" alt="Control buttons 2" />

3D control custom buttons:

* Compass: centers 3D view to north
* Geolocation: centers 3D view to the project
* Zoom in
* Zoom out

> Please, visit the section [Custom Buttons](#custom-buttons) to learn how to add your own functions.

### Notifications

Everytime an operation is being executed, it will appear at the top of the canvas a bar with the name of that operation. Its color represents the type of notification:

* Red: error
* Orange: warning (you should wait until the operation is finished)
* Green: success
* Blue: info

<img class="w100" src="./layout-doc-imgs/canvas/notifications.jpg" alt="Notifications" />

<div class="page-break"></div>

# Buildings

## Building creation

To start using the tool you need to create your first building. To do so you can either click on the start button in the aside panel or in the '+' icon, in the top left corner inside the canvas area.  There is no limit on the number of buildings to create.

<img class="w300px" src="./layout-doc-imgs/building/building-create-button.png" alt="Create Building Button">

Since v3.24.0, once you click to create a new building, you will be prompted to choose which mode to use, there are available two ways of creating buildings: 

<img class="w200" src="./layout-doc-imgs/building/building-creation-mode.png" alt="Building Creation Modes">

### Custom shapes
Custon Shapes lets you quickly create a building from a predefined set. This mode is designed to quickly add buidings to the project with common shapes. The current ones are:

<img class="w200" src="./layout-doc-imgs/building/custom-shape-types.png" alt="Custom Shapes (Types)">

Once you select one it will be created in the project center. You can tweak this custom shape from the aside panel (note that the canvas points can't be edited as they're grayed out). Configure the size of the edges and the building rotation in the panel. Clicking on *Finish* you will proceed to edit the building as regular one (see next section *Draw Shape*). Once the building is created you can move it like any other building to the desired place.

Special mention to the *Step by step* type. This powerful option lets you define a bulding wall by wall:

<img class="w200" src="./layout-doc-imgs/building/custom-shapes-stepbystep.png" alt="Building Creation Modes">

In the example above the user has configured the settings of 4 walls with their respective lengths and angles, plus a closing wall from the first to the last point. The closing wall is calculated automatically so you don´t have to worry about it.

To add a new wall you only need to click the *Add Step* button in the panel, the new wall will be listed below the ones already there and you can set it up as you wish.

### Draw shape

Draw shape: the conventional way of creating buildings, in this mode you have to click on the canvas tu add each of the points that will define the shape of your building.

> Please, visit the section [Drawing with Snaps](#drawing-with-snaps) to learn how to draw.

Keep in mind that the different parts of the user interface serve different purposes:
* In the canvas area, you will be able to customize the shape of the building by clicking in the desired places.
* In the aside panel, you will be able to change options such as 'Populate with modules' and 'Building height'.

The 'Building Height' input can be configured to:

* Gutter: the height will be measured from the floor to the lowest point of the roof.
* Ridge: the height will be measured from the floor to the peak of the roof. Is the place where usually two (or more) opposing planes meet.

<img class="w300px" src="./layout-doc-imgs/building/building-height.png" alt="Building Height toggle" />

> Change height units clicking on the current units to the right of the height number.

The 'Populated with modules' option determines if the building will be created with or without modules. It is useful to deactivate it for simulating the shadows of the buildings.

You can activate the modules in the building edition (this configuration will be shown everytime the layout is loaded) or enabling the corresponding area in the area section.

<img class="w300px" src="./layout-doc-imgs/building/populated-with-modules-toggle.png" alt="Populated with modules toggle" />

> Please, visit the section [Drawing with Snaps](#drawing-with-snaps) to learn how to draw.

The next step once you have drawn the building is setting up the roof. There are different types of roofs depending on the shape of the building (if the building is irregular, the roof can only be flat or pent).

These are all the types of roof (available on regular buildings):

<img class="w300px" src="./layout-doc-imgs/building/roof-types-v.3.25.png" alt="Roof types" />

Each roof is composed of a determined number of areas that are automatically created.

You can also choose a roof material despite it is only informative. The material options are common for all roof types (tiled, trapezoidal, and corrugated): 

<img class="w200px" src="./layout-doc-imgs/building/roof-materials-1.png" alt="Rest of Roof materials" />

Except for the flat roof type (gravel, bitumen, membrane, and concrete):

<img class="w200px" src="./layout-doc-imgs/building/roof-materials-2.png" alt="Flat Roof materials" />

When the operation is finished, the textures of the building are generated using the mapper tool and the modules appear in a default subarea.

> Please, visit the section [Textures](#textures) to learn how they are generated.

Once the building is created, you will be able to:

* Edit
* Move
* Remove
* Clone (it will be cloned with the same settings)
* Paint

## Select building

By clicking in the buildings indexes, below the add building button ('+' icon), you can select them. The selected building will become the active one and the canvas will be centered on that building. This is very useful when you are on a projects with several buildings and you want to focus your view on one. After selecting a building, the aside panel will show the properties of the building.

## Edit building

You can select between editing the building or editing the roof.

In the first option you can modify the building vertices following the steps of the building creation.
If you edit the roof you can select any type of roof and it will be recalculated.

<img class="w300px" src="./layout-doc-imgs/building/building-edit.png" alt="Building edit" />

## Roof editor

You can edit a roof by clicking in the pencil icon in the roof section:

<img class="w300px" src="./layout-doc-imgs/building/roof-editor.png" alt="Roof edit" />

After that, you can change the roof type in a similar way as you did when creating the building. To know the interactions available in each roof type, read the draggable help window that displays the interactions with each roof:

<img class="w200px" src="./layout-doc-imgs/building/roof-editor-helper.png" alt="Roof editor helper" />

> You can click on the upper right corner to minimize the helper if you need more available space to work.

### Pent and pergola

<img class="w200px" src="./layout-doc-imgs/building/pent-editor.png" alt="Pent & Pergola Editor" />

Lets you modify the angle of inclination by clicking somewhere inside the roof and changing the angle. You can change the orientation of the roof by clicking one of the roof edges and selecting "Change Orientation".

### Pyramid

<img class="w200px" src="./layout-doc-imgs/building/pyramid-editor.png" alt="Pyramid Editor" />

Similar to pents but this roof has four faces instead of one and you can move the top vertex (the peak of the pyramid) to adjust to the desired shape.

### Gabled

<img class="w200px" src="./layout-doc-imgs/building/gabled-editor.png" alt="Gabled Editor" />

Gabled roofs lets you move the edge of the ridge along the whole roof base. You can also change the inclination of the planes as with previous roofs. To change the orientation of the ridge you can click on one edge (like with pent roofs) or using the icons in the aside panel called: East/West or South/North.

### Hipped

<img class="w200px" src="./layout-doc-imgs/building/hipped-editor.png" alt="Hipped Editor" />

Similar in options to a gabled roof, but slightly more complex. The main difference is that in hipped you have two vertex that define the ridge of the roof (the edge at the peak). There's a switch in the aside panel to ensure the symmetry of the ridge.

### Mansard

<img class="w200px" src="./layout-doc-imgs/building/mansard-editor.png" alt="Mansard Editor" />

The first time you convert a roof to a mansard you'll see that a basic mansards is like a pyramid roof that has the upper part sectioned. 

In a mansard roof, besides the inclination settings available in other roof types, it is possible to change the size of a four-sided ridge. If the symmetric ridge switch in the panel is on, the ridge will have a perfect square ratio.

After clicking *Finish* with a mansard roof, you will see two roofs in the aside panel:

<img class="w300px" src="./layout-doc-imgs/building/mansard-second-roof-A.png" alt="Mansard Editor" />

You can change the default flat roof (Roof 2 in the previous image) created on top of the mansard to other type of roof. The image below shows a mansard with a pent roof on top as an example:

<img class="w40center" src="./layout-doc-imgs/building/mansard-second-roof-B.png" alt="Mansard Compound Roof" />

<div class="page-break"></div>

# Areas

The areas are sections on the roof that are automatically created when selecting the type of roof.

Each area is composed of at least one subarea and has the information of the number of modules it contains and the power that generates.

If you want to disable one area, you can click on the eye button next to its name. By doing this, its module count and power generated will be set to 0.

<img class="w75" src="./layout-doc-imgs/general/area-disabled.jpg" alt="Area disabled" />

## Edit area

To edit an area you can modify the edge zone value. It is a numeric value that specifies the distance between the building limits and the subareas that exist within that area.

<div class="page-break"></div>

# Subareas

A subarea is a region inside an area that allows you to define a modules installation just in a section of the area.

By clicking on a subarea, two views will appear: the project view (top) and the subarea view (bottom).

The subarea view is hidden by default. To toggle its view, you have to click on the button 'Open subarea view' or 'Close subarea view' at the bottom of the canvas.

<img class="w75" src="./layout-doc-imgs/subarea/edit-subarea.jpg" alt="Subarea view" />

> Note that when moving the subarea or changing its azimuth the subarea view will be opened. This is because this view hasn't got any deformation.

## Subarea creation

To create a subarea click on the 'Create subarea' button.

<img class="w200px" src="./layout-doc-imgs/subarea/subarea-creation-button.png" alt="Subarea creation button" />

Once the subarea is created, you will be able to:

* Edit
* Move
* Refresh
* Remove (only if the area has more than one subarea)
* Clone (it will be cloned with the same settings)

<img class="w200px" src="./layout-doc-imgs/subarea/remove-add-subareas.png" alt="Remove add subareas" />

If you want to disable one subarea, you can click on the eye button next to its name. By doing this, its module count and power generated will be set to 0.

<div class="page-break"></div>

## Add subarea

By clicking the 'Create subarea' button you enter in the subarea creation process.

If you create the first subarea it will replace the default one.

<img class="w75" src="./layout-doc-imgs/subarea/add-subarea.jpg" alt="Add subarea" />

### Crop subarea to the area shape

When editing the vertices of a subarea you can check the 'Crop' option. This helps you to draw subareas that extends to the border of the building with more precision.

<img class="w200px" src="./layout-doc-imgs/subarea/crop-shape-building-toggle.png" alt="Crop shape building toggle" />

If you uncheck this option then the subarea can extend outside the area, following the area plane.

<img class="w75" src="./layout-doc-imgs/subarea/subarea-sample.jpg" alt="Subarea sample" />

### Edit subarea vertices

By clicking this button you can modify subarea vertices and the subarea will be recalculated.

<div class="page-break"></div>

## Edit subarea

By clicking on a subarea you enter in the subarea edition process.

<img class="w75" src="./layout-doc-imgs/subarea/edit-subarea.jpg" alt="Edit subarea" />

You will be able to refresh, paint or move all the modules.

These are all the subarea edition options:

* Module model: there are different module models available that have different size, weight and watt peak capacity
* Module orientation: you can choose between 'landscape' and 'portrait'
* Panels orientation: you can choose between 'south' and 'east/west'
* Module inclination
* Distance between modules
* Distance between rows
* Distance between centers
* Use max. shadow calculation: calculates the distance between rows and centers depending on the module inclination
* Azimuth: modules rotation
* Staggered enabled
* Sails
* Dilatation lines

Here, you can click on any module to enable/disable it. If you right click on a module it will be displayed its position (row and column).

## Remove subarea

By clicking this button you can remove a single subarea from the subareas list. It is only available if there exists more than one subarea.

<div class="page-break"></div>

# Keepouts

Keepouts are created for simulating any obstacle that might interrupt the installation of modules.

When a keepout is created, there can't be any module that occupies the same position.

You can customize them by changing their height, offset and type (vertical or inclined).

<!-- FIX

## Keepout height calculations

When creating keepouts, please note the height selected for the keepout is not always the final keepout height.

Depending on the roof inclination and the keepout dimensions and positions, there is a minimum keepout height to avoid keepouts under the roof surface.
Let's see an example:

<img class="w100" src="./layout-doc-imgs/keepout/keeoput-height-scheme.jpg" alt="keeoput-height-scheme" />

In keepout 1, A is the desired height, and B is the minimum height for this keepout. As A is bigger than B then the keepout is created with the desired height (A).

In keepout 2, A is also the desired height, but the keepout can't be drawn correctly if the height is less than B measure, as some parts of the keepout will stay below the roof, so keepout 2 will be created with the minimum calculated height (B).
-->

> Note that for flat roofs it is posible to create 0 height keepouts, but for inclinated roofs you need to use the invisible keepouts feature to allow keepouts at roof surface level.


## Invisible keepouts

If you want to simulate a skylight or any keepout object without drawing the 3D volume you can check the 'Invisible keepout' option to hide the 3D volume but still taking the obstacle into account.

<img class="w200px" src="./layout-doc-imgs/keepout/invisible-keepout-toggle.png" alt="Invisible keepout toggle" />

## Crop keepout to the building shape

When editing the vertices of a keepout you can check the 'Crop shape to building limits' option. This helps you to draw keepouts that extends to the border of the building with more precision.

<img class="w200px" src="./layout-doc-imgs/keepout/crop-shape-keepout-toggle.png" alt="Crop shape keepout toggle" />

If you uncheck this option then the keepout can be floating outside the building limits. At least one vertex of the keepout should be inside the building limits to be created.

## Vertical and inclined keepouts

You can create a keepout as vertical or inclined. If the keepout is inclined, it will be created starting from the inclination of the building.

<div class="page-break"></div>

# Trees

Trees belong to the scene, not to a building.

It is important to create trees for simulating the shadows on the roofs. Therefore, you will be able to move them and modify their height and radius. The shape of the tree is calculated according to the proportion of these values.

<img class="w75" src="./layout-doc-imgs/general/tree.jpg" alt="Tree" />

<div class="page-break"></div>

# Drawing with Snaps

The snap is a helpful tool for drawing buildings, subareas and keepouts.

There are three ways for drawing points: without snap, using **guide lines** or a **grid**.

## Without Snap
You can draw unassisted disabling both snap options. With this option you can put a point anywhere.

<img class="w100px" src="./layout-doc-imgs/snaps/snap-without-options.png" alt="Snap disabled" />

## Guide lines

'Guide lines' is the default option when drawing. There are two ways for drawing points that can be combined to make the process easier: lines and vertices.

<img class="w100px" src="./layout-doc-imgs/snaps/snap-guide-lines.png" alt="Snap guide lines" />

To use them, you need first to draw two points. Once you have drawn them, there will appear parallel and perpendicular guide lines to the last drawn point. This way you can create regular shapes with right angles (it is also possible to move points along these guide lines).

Switching to the 'Vertices' option allows you to draw points at the intersections of the guide lines and the vertices of the buildings.

> Please, visit the section [Context panel](#context-panel) to see more drawing features.

## Grid

When selecting this option appears a grid that occupies the entire canvas area.

<img class="w100px" src="./layout-doc-imgs/snaps/snap-grid.png" alt="Snap grid" />

You can customize it by specifying a number for the grid size (size of each square) and an offset in the x and y coordinates for moving the grid.

> Please, visit the section [Context panel](#context-panel) to see more drawing features.

<div class="page-break"></div>

## Context panel

### On a point

<img class="w100px" src="./layout-doc-imgs/snaps/context-panel-point.jpg" alt="Context panel point" />

When right clicking a point, you can:

* Draw guides here (only in 'Guide lines' option): draws parallel and perpendicular guide lines to this point in relation to the selected edge
* Remove all guides (only in 'Guide lines' option): removes all guide lines except the ones to the selected point
* Select/deselect point: this is useful for moving many points along a guide line at once
* Deselect all points: deselects all points except the last selected one
* Delete point

### On an edge

<img class="w100px" src="./layout-doc-imgs/snaps/context-panel-edge.jpg" alt="Context panel edge" />

When right clicking an edge (only in 'Guide lines' option), you can:

* Select/deselect edge as guide: redraws the parallel and its perpendicular guide lines to the selected edge
* Select/deselect all edges as guide

### On a module

<img class="w100px" src="./layout-doc-imgs/snaps/context-panel-module.jpg" alt="Context panel module" />

By right clicking a module, it will display:

* The position of the module (column and row)
* Its index position in the row
* Its index position in the column

If dilatation lines are disabled, there are also two buttons to:

* Change row modules orientation
* Add row offset

### On a keepout in subarea view

<img class="w100px" src="./layout-doc-imgs/snaps/context-panel-keepout.jpg" alt="Context panel keepout" />

By right clicking on a keepout in the subarea view you can set that keepout as active, closing the subarea view.

### On an object

<img class="w100px" src="./layout-doc-imgs/snaps/context-panel-area.jpg" alt="Context panel area" />

You can also right click on any object in the svgProject. You will be able to set active, edit, move, etc the current object and its parents objects (ex: from a subarea you can execute areas and building operations).

<div class="page-break"></div>

# Textures

The textures are images obtained from the satellite displayed on the roof, with the same size and position.

They are generated by default when a building is created. You can disable their automatic creation in the Preferences panel.

<img class="w200px" src="./layout-doc-imgs/general/building-textures-toggle.png" alt="Building textures toggle" />

> Please, visit the section [Layout Rules](#layout-rules) to learn how to customize this property.

<img class="w200px" src="./layout-doc-imgs/general/textures.png" alt="Textures" />

In the building panel you can see the different options for the satellite image textures:

* '+' : adds satellite texture for the active building
* Refresh (available when the active building has textures)
* Remove (available when the active building has textures)
* Generate for all buildings
* Remove all satellite textures

> Note that the textures generation might fail because of the speed of the internet connection or the speed of response of the satellite image provider. For preventing the failure you can select each building and wait for the satellite images to load or refresh the textures individually.

<div class="page-break"></div>

# Shortcuts

The shortcuts can be used in the following cases:

* To navigate between tabs, press 1, 2, 3 or 4
* To execute undo press 'Ctrl + Z', and to execute redo press 'Ctrl + Y'
* When drawing:
    * To enable/disable snap to guides, press 'S'
    * To toggle between guide lines and vertices you can hold 'Ctrl' / '⌘'
    * To select/deselect vertices, click on them while pressing 'Shift'
* Editing a subarea:
    * Hold 'Shift' for selecting the hole row
    * Hold 'Ctrl' / '⌘' for selecting the hole column
* Moving a building, subarea or keepout:
    * Down: Numpad 1, 2, 3 | 'End' | 'Down arrow' | 'Page down'
    * Left: Numpad 1, 4, 7 | 'End' | 'Left arrow' | 'Home'
    * Right: Numpad 3, 6, 9 | 'Page down' | 'Right arrow' | 'Page up'
    * Center: Numpad 5 | 'Clear'
* Save: for saving the project in crm you can press 'Ctrl + Shift + S' / '⌘ + Shift + S'
* Widgets:
    * To cancel the operation or close the widget, press 'Esc'
    * To confirm the operation, press 'Enter'

Anyways, these shortcuts will be displayed on a widget, so you can consult them when necessary.

<img class="w100px" src="./layout-doc-imgs/subarea/move-subarea-widget.png" alt="Move subarea shortcuts widget" />

> For users with Mac operating system, Ctrl key in shortcuts will be disabled using the Command key instead (⌘).

<div class="page-break"></div>

# Progress bar

Everytime a long operation is being executed, it will be displayed a progress bar to inform the user.

The progress bar it's composed of:

* Title: name of the operation being executed
* Label 1: function withing the operation
* Label 2: step of the funcion
* Bar: if there is a determinate number of steps it will be increasing its value, if not, it will be shown as an animation
* Cancel button: only visible on 'Waiting for satellite tiles' generating textures step

<img class="w75" src="./layout-doc-imgs/general/progress-bar-textures.jpg" alt="Generating textures progress bar" />

> Please, visit the section [Progress bar customization](#progress-bar-customization) to learn how to customize the progress bar.
