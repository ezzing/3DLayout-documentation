# Introduction

Ezzing 3DLayout is a PV planning tool that allows you to generate a 3d model of a building based on a satellite image. You can model any number of buildings, select between up to five different type of roofs, define keepouts and trees with custom heights...

Inside each roof area you can customize different structures, select module models and get automated previews of your setup.

It also provides you with a perspective view and a sun simulator to determine where the shadows will be in your installation.

Ezzing 3DLayout is an embebible webapp. You can integrate it inside your own system and customize many elements inside, from module models to prefered default settings for each roof type.

In this document you will find a brief showcase of the different areas of the app, a technical explanation on how to integrate this webapp inside your platform, a full description of the API that will allow you to communicate with the 3DLayout, and finally a description on how to customize different parts of the app.

<div class="page-break"></div>
<img class="w100" src="./layout-doc-imgs/intro-mac.jpg" alt="3DLayout" />

You can test the app by visiting this link:

<a href="https://layout.ezzing.com/#/demo">https://layout.ezzing.com/#/demo</a></li>

Also you can follow a tutorial to learn the basics of the 3DLayout in this link:

<a href="https://layout.ezzing.com/#/tutorial">https://layout.ezzing.com/#/tutorial</a></li>

<div class="page-break"></div>
# Screenshots

<img class="w100" src="./layout-doc-imgs/perspective-view-mac.jpg" alt="perspective view" />

<img class="w100" src="./layout-doc-imgs/sun-simulation-mac.jpg" alt="sun simulation" />

<div class="page-break"></div>
# 3DLayout Interface


The 3DLayout interface has two diferent parts. The **aside panel** and the **canvas area**.

## Aside Panel

In the aside panel you can find functionalities related to the current active building and other objects in the scene.

<br>

<img class="w100" src="./layout-doc-imgs/tab-building-mac.jpg" alt="tab building" />

<img class="w100" src="./layout-doc-imgs/tab-areas-1-mac.jpg" alt="tab areas 1" />
<br>
<img class="w100" src="./layout-doc-imgs/tab-areas-2-mac.jpg" alt="tab areas 2" />


<img class="w100" src="./layout-doc-imgs/tab-keepouts-mac.jpg" alt="tab keepouts" />
<br>
<img class="w100" src="./layout-doc-imgs/tab-trees-mac.jpg" alt="tab trees" />

<div class="page-break"></div>
## Canvas Area

In the canvas area you can see the satellite view and three diferent sets of elements, the **buildings index** on the left side, the **main options buttons** on the top, and the **control buttons** on the bottom-right corner.

<img class="w100" src="./layout-doc-imgs/canvas.jpg" alt="canvas" />

<div class="page-break"></div>
### Buildings Index

In the buildings index you can see the active building and select another one to become active.

<img class="w200px" src="./layout-doc-imgs/buildings-index.jpg" alt="buildings-index" />

<br>

### Main Options

These are the main options in the canvas area. 

<img class="w100" src="./layout-doc-imgs/mainoptions.jpg" alt="mainoptions" />

All this buttons are the **main options custom buttons**. You can customize this set of buttons by hidding some of them, by sorting them, or by adding new buttons.

The default custom buttons are:

* redo
* undo
* save
* snapshot
* sun simulation
* perspective view
* fullscreen
* satellite provider selector (only showed if available)

> Please, visit the section [Custom Buttons](#custom-buttons) to learn how to add your own buttons.

### Control Buttons

These are map related buttons. You can also customize the upper section of this set of buttons by hidding some of them or by adding new buttons 

<img class="w100px" src="./layout-doc-imgs/controlbuttons.jpg" alt="controlbuttons" />

Fixed buttons in this area:

* zoom in
* zoom out

Default control custom buttons

* search address
* geolocation

> Please, visit the section [Custom Buttons](#custom-buttons) to learn how to add your own functions.


<div class="page-break"></div>
# Keepouts

## Keepout height calculations

When creating keepouts, please note the height selected for the keepout is not always the final keepout height.

Depending on the roof inclination and the keepout dimensions and positions, there is a minimum keepout height to avoid keepouts under the roof surface.

Let's see an example:

<img class="w100" src="./layout-doc-imgs/imgs-sin-monitor/keeoput-height-scheme.jpg" alt="keeoput-height-scheme" />

In keepout 1, A is the desired height, and B is the minimum height for this keepout. As A is bigger than B then the keepout is created with the desired height (A).

In keepout 2, A is also the desired height, but the keepout can't be drawn correctly if the height is less than B measure, as some parts of the keepout will stay below the roof, so keepout 2 will be created with the minimum calculated height (B).

> Note that for flat roofs it is posible to create 0 height keepouts, but for inclinated roofs you need to use the invisible keepouts feature to allow keepouts at roof surface level.


<div class="page-break"></div>
## Invisible keepouts

If you want to simulate a skylight or any keepout object without drawing the 3d volume you can check the Invisible keepout option to hide the 3D volume but still taking the obstacle into account.

<img class="w200px" src="./layout-doc-imgs/imgs-sin-monitor/invisible-keepout-toggle.jpg" alt="invisible-keepout-toggle" />

## Crop keepout to the building shape

When editing the vertices of a keepout you can check the 'crop to building limits'. This helps you to draw keepouts that extends to the border of the building with more precision.

<img class="w200px" src="./layout-doc-imgs/imgs-sin-monitor/crop-shape-building-toggle.jpg" alt="crop-shape-building-toggle" />

If you unckeck this option then the keepout can be floating outside the building limits. At least one vertex of the keepout should be inside the building limits to be created.

<div class="page-break"></div>
# Subareas

## Subarea creation

A subarea is a region inside an area that allows you to define a modules installation just in a section of the area.

To create a subarea click on the 'create subareas' button.

<img class="w200px" src="./layout-doc-imgs/imgs-sin-monitor/subarea-creation-button.jpg" alt="subarea-creation-button" />

Once the subarea button is activated the standard area functions become disabled and two new buttons appears:

<img class="w200px" src="./layout-doc-imgs/imgs-sin-monitor/remove-add-subareas.jpg" alt="remove-add-subareas" />

* Add subarea
* Remove subareas

## Add subarea

By clicking the 'add subarea' button you enter in the subarea creation process.

| <img class="w100" src="./layout-doc-imgs/imgs-sin-monitor/add-subarea.jpg" alt="add-subarea" /> | <img class="w200px" src="./layout-doc-imgs/imgs-sin-monitor/crop-shape-building-toggle.jpg" alt="crop-shape-building-toggle" /> |

## Remove Subareas

By clicking the 'remove subareas' button all the subareas are removed and the area come back to its standard behaviour.

## Crop subarea to the area shape

When editing the vertices of a subarea you can check the 'crop to building limits'. This helps you to draw keepouts that extends to the border of the building with more precision.

<img class="w200px" src="./layout-doc-imgs/imgs-sin-monitor/crop-shape-building-toggle.jpg" alt="crop-shape-building-toggle" />

Once created the subarea is listed below this buttons. You can then proceed to setup the subarea in the same way you work with standard areas.

<img class="w100" src="./layout-doc-imgs/imgs-sin-monitor/subarea-sample.jpg" alt="subarea-sample" />

If you uncheck this option then the subarea can extend outside the area, following the area plane.

