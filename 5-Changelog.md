<div class="page-break"></div>

# Changelog

## v3.23.0 (20/11/2019)
### Features
- Improved drawing speed.
- New context panel buttons (by right-clicking on buildings, areas, subares, etc. from canvas).
- When moving an object, other objects don't interfere.
- Subareas can be moved with keyboard shortcuts.

### Fixes
- Finish panels button is locked when the operation has not been validated.
- Drawing alignment when switching perspective mode from 3D to 2D.


## v3.21.0 (00/09/2019)
### Features
- New drawing in svgProject.
- New cancel button on progress bar when generating textures.
- Manage area habilitation from context menu (by right clicking on an area in svgProject).

### Fixes
- Deprecated layoutRules on aside header creation refactor.


## v3.20.0 (29/08/2019)
### Features
- Undo/redo feature.
- New module sails (available in subarea info panel).

### Fixes
- Implemented compass rotation in the subarea view.
- Fixed autocad export error.
- Update system info when changing dilatation lines values.
- Close subarea panel on tab change.
- Keepout projection error.
- Removed vertical line on project loading screen.
- Bug when switching perspective mode with an active subarea.
- Error on zoom when Player is disabled.


## v3.19.0 (09/08/2019)
### Features
- Compass and Center view buttons have been added in Showcase mode.
- New benchmarks with 1000 and 100000 modules for performance testing.
- New layoutRule to include inset in dilatation lines.
- Path editor is now created as a json.

### Fixes
- The Showcase widget has been removed and the old shortcuts have been restored (camera traslation and rotation).
- Removed Mapper flickering when redrawing buttons.
- Fixed zoom when selecting a tree.
- Cloning a subarea displays its information updated.
- Fixed a bug in building indexes when canceling the creation of a building.
- Fixed the Move subarea button performance when cloning a subarea repeatedly.
- Fixed an error when creating a building after editing another one.
- Json editor buttons click work properly.
- It is now controlled when buildings have to be rendered.
- Fixed ‘Invalid Lat, Lng’ console error.
- Fixed resize listener related to bootstrap error.


## v3.18.0 (03/06/2019)
### Features
- Created new tree shapes.
- Changed cancel widget button background color to gray.
- Logo and attributions aren't displayed when Mapper is deactivated.
- Recovered sun and flares in the sky.
- Change project center depending on first building vertex distance from original center.

### Fixes
- Perspective widget is displayed at the left side of the canvas.
- Changed providers selector style.
- Fixed bottom buttons interruption on canvas drag.


## v3.17.1 (29/05/2019)
### Fixes
- Change initial perspective widget position.


## v3.17.0 (13/05/2019)
### Features
- New alert: the layout blocks when browser is not Chrome.
- New features in sun simulation widget. Now you can set the date with the shortest or longest shadow, and reset the date to its default value. A new layoutRule has been defined to modify the default date of the simulator.
- Shortcuts widgets style improvements.
- There are new shortcuts to navigate between the main tabs. By pressing keys 1, 2, 3 and 4 you can navigate between Building, Areas, Objects and Preferences panels, respectively.
- New alternative of using Command key instead of Ctrl in computers with mac OS operating system.

### Fixes
- Fixed a bug related to the subarea clone.
- Fixed the translation and rotation in perspective mode and changed shortcuts.


## v3.16.0 (30/04/2019)
### Features
- Context panel improvements on hover.
- New button to show and hide subarea view.
- Modified the progress bar (new styles showing information for the user).
- Snap to vertices shortcuts improvements in Windows and Mac.
- Created browser check.

### Fixes
- Reset modules when changing orientation.
- Fixed unnecessary console warning.
- Check modules number before deleting them.
