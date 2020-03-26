<div class="page-break"></div>

# Changelog

## v3.25.0 (2020-03-24)

### Features
- Read-only mode.
- New roof type: mansard.
- Navbar (Building/Areas/Object/Map/...) located at the very top: better visualization of panel options!
- Enhanced undo/redo feature. We've got you covered!
- Map snapshots.

### Fixes
- Fix bug due to users ommiting modals messages while changing attributes.
- Performance boost.
- Stability improvements.
- Other minor fixes.

---

## v3.24.0 (2020-02-10)

### Features
- Building Shapes: you can use common predesigned building shapes. Let's skyrocket that productivity!
- Improved roof geometries.
- New roof type: pergola. <!-- Hey! Review translation the translation for: 'pergola' -->
- You can move roof points symmetrically (hipped roofs).
- Turkish translations: Selam!

### Fixes
- Fix default module height was displayed in millimeters (instead of meters).
- Labels displaying wrong when dilatation lines were added.
- Snap to grid now behaves correctly.
- Now modules being dragged show their right color.
- Other minor fixes.

---

## v3.23.0 (2019-11-20)

### Features
- Improved drawing speed.
- New context panel buttons (by right-clicking on buildings, areas, subares, etc. from canvas).
- When moving an object, other objects don't interfere.
- Subareas can be moved with keyboard shortcuts.

### Fixes
- Finish panels button is locked when the operation has not been validated.
- Drawing alignment when switching perspective mode from 3D to 2D.

---

## v3.21.0 (2019-09-23)

### Features
- New drawing in svgProject.
- New cancel button on progress bar when generating textures.
- Manage area habilitation from context menu (by right clicking on an area in svgProject).

### Fixes
- Deprecated layoutRules on aside header creation refactor.

---

## v3.20.0 (2019-08-29)

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

---

## v3.19.0 (2019-08-09)

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

---

## v3.18.0 (2019-06-03)

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

---

## v3.17.1 (2019-05-29)

### Fixes
- Change initial perspective widget position.



## v3.17.0 (2019-05-13)

### Features
- New alert: the layout blocks when browser is not Chrome.
- New features in sun simulation widget. Now you can set the date with the shortest or longest shadow, and reset the date to its default value. A new layoutRule has been defined to modify the default date of the simulator.
- Shortcuts widgets style improvements.
- There are new shortcuts to navigate between the main tabs. By pressing keys 1, 2, 3 and 4 you can navigate between Building, Areas, Objects and Preferences panels, respectively.
- New alternative of using Command key instead of Ctrl in computers with mac OS operating system.

### Fixes
- Fixed a bug related to the subarea clone.
- Fixed the translation and rotation in perspective mode and changed shortcuts.

---

## v3.16.0 (2019-04-30)

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

---

## v3.15.0 (2019-04-02)

### Features
- Better tracking of the layout events.
- Areas/subareas now show surfaces in square meters (m²).
- Added benchmarking for the model.
- Extended capabilities in operators.
- Add possibility of delays to event execution.
- Improved movement in the player (now using ratios).
- Improved mouse wheel event handling (D3.js).
- Save option available in modal when generating all textures.
- Create shortcuts for widgets and control over the active one.

### Fixes
- Fix modules that randomly misaligned in some cases.
- Reduced the number event listeners used.
- Module count not working as expected with disabled subareas.
- Other minor fixes.

---

## v3.14.0 (2019-03-11)

### Features
- Improved draw and behaviour of path editor and locations.
- Better draw of trees.
- New favicon.
- Widget shortcuts when moving objects.
- More modular panels now with blocks.

### Fixes
- Now when language is changed, widgets are updated.
- Fixed: hover disabled eye in areas and subareas.
- Fixed widgets minimize in Firefox.
- Replaced mansard icon with the correct resolution.

---

## v3.13.0 (2019-02-13)

### Features
- Improved path editor.
- UI/UX: Less eyestrain with the new default building color.

### Fixes
- Fixed some issues when adjusting dilatation lines.
- Other minor fixes.

---

## v3.12.0 (2019-02-07)

### Features
- UI/UX: More informative widget titles.
- UI/UX: More coherent flows (removed buttons that weren't supossed to appear).
- Internal improvements related to operators, navigation panels, and more.

### Fixes
- Fixed some button behaviours.
- Fixed mapper button margin.
- Other minor fixes.

---

## v3.11.0 (2019-01-17)

### Features
- UI/UX: Building color visible in building index buttons.
- Improved the change of a provider on the Mapper button.

### Fixes
- Fix system draws not happening sometimes.
- Fix some zoom issues when drawing modules.
- Other minor fixes.

---

## v3.10.0 (2019-01-08)

### Features
- Snap to vertices now works with roof points.
- Improved voronoi implementation.

### Fixes
- Documentation reviewed and updated.
- Fixed error drawing keepouts when user is editing a roof.
- Fix issue with render update in perspective mode.
- Other minor fixes.

---

## v3.9.2 (2018-12-11)

### Fixes
- Some code cleanup (temporal locations).



## v3.9.1 (2018/12/05)

### Fixes
- System appears shifted after azimuth change.
- Fix bug when getting all textures.

---