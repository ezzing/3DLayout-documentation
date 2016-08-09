<div class="page-break"></div>
# Integration in a non-angular platform

To integrate the 3DLayout into your platform, you only need this five files

* angular_lib.js - include the angular library
* ezzing3DApp.js - Integration tools (contains the ezzing3D constructor and  API functions)
* ezzing3D.js    - contains the platform code.
* lib.js         - some other useful third party libraries
* screen.css     - contains the 3DLayout css styles

Copy this files into the desired path (i.e: public/ezzing3d/)

## HTML code

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

## Javascript code

To instantiate the ezzing3D object and start the app you need to run this lines inside your javascript code:

    var container = window.document.getElementById('ezzing3d');
    var layout = new ezzing3D(container, {
            token: token,
            id: id,
            failURL: '#/fail',
            showcase: showcase
        });

The attributes for this constructor are:

* **container**: the DOM element with id='ezzing3d'

* **token**: the user token from the CRM

* **id**: the CRM project id. This value can also be used to activate special modes in the 3DLayout. Use id="demo" to run a 3DLayout demo with an empty project. Use id="tutorial"  to run an interactive tutorial. Use id="landing" to view an special showcase demo project.

* **failURL**: an alternative URL to redirect the user when token or id from CRM fails.

* **showcase**: When this value is true the project is opened in a special showcase mode, without graphic interface and in a nice 3d view. This mode is read-only and the project can not be modified.

