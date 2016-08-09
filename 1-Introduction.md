# Introduction

Ezzing 3DLayout is a PV planning tool that allows you to generate a 3d model of a building based on a satellite image. You can model any number of buildings, select between up to five different type of roofs, define keepouts and trees with custom heights.

Inside each roof area you can customize different structures, select module models and get automated previews of your setup.

It also provides you with a perspective view and a sun simulator to determine where the shadows will be in your installation.

Ezzing 3DLayout is an embebible webapp. You can integrate it inside your own system and customize many elements inside, from module models to prefered default settings for each roof type.

In this document you will find a brief showcase of the different areas of the app, a technical explanation on how to integrate this webapp inside your platform, a full description of the API that will allow you to communicate with the 3DLayout, and finally a description on how to customize different parts of the app.

<img class="w100" src="./layout-doc-imgs/intro-mac.jpg" alt="3DLayout" />

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

This are the main options in the canvas area. 

<img class="w100" src="./layout-doc-imgs/mainoptions.jpg" alt="mainoptions" />

The three left-sided buttons are the **main options fixed buttons**:

* redo
* undo
* save

The right aligned buttons are the **main options custom buttons**. You can customize this set of buttons by hidding some of them or by adding new buttons.

The default custom buttons are:

* satellite provider selector (only showed if available)
* snapshot
* sun simulation
* perspective view
* fullscreen


> Please, visit the section [Custom Buttons](#custom-buttons) to learn how to add your own functions.

### Control Buttons

This are map related buttons. You can also customize the upper section of this set of buttons by hidding some of them or by adding new buttons 

<img class="w100px" src="./layout-doc-imgs/controlbuttons.jpg" alt="controlbuttons" />

Fixed buttons in this area:

* zoom in
* zoom out

Default control custom buttons

* search address
* geolocation

> Please, visit the section [Custom Buttons](#custom-buttons) to learn how to add your own functions.

