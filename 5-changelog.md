<div class="page-break"></div>

# Changelog

## [2.10.0] - 2016-10-21

### Added

**Subareas feature**. You can read about this new feature in the [Subareas](#subareas) section.

New **Subarea related API calls". You can read about this new feature in the [Subarea related functions](#subarea-related-functions) section.

**Keepout height calculations** explanation. You can read about how keepout heights are calculated in the [Keepout height calculations](#keepout-height-calculations) section.

**Invisible keepout feature**. You can read about this new feature in the [Invisible keepouts](#invisible-keepouts) section.

**Custom Alert feature**. You can read about this new feature in the [CustomAlert event](#customalert-event) section.

**Coordinate Systems** explained. You can read about this in the [Layout Coordinate Systems](#layout-coordinate-systems) section.

### Fixed

Fixed an issue preventing to delete first point on building, keepout or subarea creation.

### Deprecated

We find a typo error in the name of a function:

*getModulesSructureByArea*  becomes  *getModulesStructureByArea*

**getBuildingInfo**
verticesDeg attribute will be deprecated

**getBuildingPosition**
center attribute will be deprecated >  becomes  centerDeg
vertices attribute will be deprecated 

**getAreaInfo**
areaMCoords will be deprecated  >  becomes  verticesMCoords,
areaOffsetMCoords will be deprecated  >  becomes  verticesOffsetMCoords

> The old names still works but is recommended to update your code.

### Changed

Some API calls were updated to reflect subarea feature. *GetLayoutData*, *getNumberOfModules*, *GetPower*, *getBuildingInfo* and *getAreaInfo* were changed to add subarea information.

## [2.9.1] - 2016-09-19

### Fixed

Fix tutorial to show new features on building creation (auto calculated point)

## [2.9.0] - 2016-09-18

### Fixed

Fixed a bug that prevented all buildings to be removed from a project.

Fixed some minor css issues

## [2.8.0] - 2016-09-14

### Changed

Improved country detection internal functions.

## [2.7.0] - 2016-09-09

## added

**Tutorial mode** access information. You can read about this new feature in the [Tutorial mode](#tutorial-mode) section.

**Custom Logo in tutorial** section. You can read about this new feature in the [Custom Logo in tutorial section](#custom-logo-in-tutorial-section) section.

**Customize Go back button** in the tutorial menu. You can read about this new feature in the [Customize Go back button in the tutorial menu](#customize-go-back-button-in-the-tutorial-menu) section.

**azimuthOffset** option to define your prefered convention for south faced modules. You can read about this new option in the [azimuthOffset](#azimuthoffset)

Roof inclination in degrees is showed in building information panel.

### Changed

New feature to add vertices on building and keepout creation. Now when 3 points are entered, the fourth one is calculated automatically (drawed in yellow) to help the creation of regular buildings. Just press "next step" when the yellow lines appears to accept the fourth point, or click again in the canvas to enter another point and go ahead with an irregular shape.

### Fixed

Minor problems in the keepout and trees lists has been fixed. Now select and edit objects is easier. 

## [2.6.0] - 2016-09-01

### added

Some minor GUI changes to clarify the workflow.

Two new showcase options, with and without camera spining. You can read a description of this options in the [Showcase mode](#showcase-mode) section.

New **perspective**, **spin** and **readonly** options. You can read a description of this options in the [Special Behaviours](#special-behaviours) section.

Custom Logo. You can read about this new feature in the [Custom Logo](#custom-logo) section.

Custom Loading Animation. You can read about this new feature in the [Custom Loading Animation](#custom-loading-animation) section.

### changed

Navigation panel, save button and building index now becomes disabled when creating a building.

Undo, redo and save buttons in mainoptions becomes custom buttons. You can read a description of this new custom buttons in the [MainoptionsCustomButtons](#mainoptionscustombuttons) section.

A helper message is showed when roof types are restricted due to irregular buildings. Also, restricted roof types are shown disabled.

A dialog window is showed when vertices or roof is edited, to alert the user about the reset of the building.

*Area offset* now is called **Edge Zone**

*Building height* now is called **Gutter height** as it doesn't count the roof height.

### fixed

Some errata in the pdf (added measure units for all values)

Fix style for loading animation to adjust to window size.

### deprecated

The *display* option is deprecated, now it's called **perspective**. Anyway, it still works with the old naming.

The layout Url extension "/true" is deprecated. You can read a description of the new extensions in the [Showcase mode](#showcase-mode) section. Anyway, it still works with the old naming.

<!--   Template to add a version to the changelog

## [2.5.0] - 2016-08-01

### added

### changed

### deprecated

### removed

### fixed

### security 

-->
