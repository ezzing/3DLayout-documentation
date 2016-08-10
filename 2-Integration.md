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

    <link rel="stylesheet" type="text/css" href="/path-to-ezzing3d-files/screen.css">

### DOM body

You need an element in the body of your html page, a div with id="layout" where the 3DLayout will fit inside.

> This div can not be bigger than the view size, and **no scroll** has to be applied to the html page.

You should not change the ezzing3d element size (width or height) but change the size of this container div.

Add this lines inside the body element in your code:

    <div id="layout">
        <ezzing3d id='ezzing3d' layoutRules='{"logo": false}'></ezzing3d>
    </div>

and these lines at the end of the body:

    <script type="text/javascript" src="/path-to-ezzing3d-files/angular_lib.js"></script>
    <script type="text/javascript" src="/path-to-ezzing3d-files/ezzing3DApp.js"></script>
    <script type="text/javascript" src="/path-to-ezzing3d-files/ezzing3D.js"></script>
    <script type="text/javascript" src="/path-to-ezzing3d-files/lib.js"></script>

## Javascript code

To instantiate the ezzing3D object and start the app you need to run this lines inside your javascript code:

    var container = window.document.getElementById('ezzing3d');

    var layout = new ezzing3D();

    layout.bootstrap(container, {
        token: token,
        id: id,
        failURL: '#/fail',
        showcase: showcase
    });

The ezzing3D contructor instance the object layout, in this object we have all the functionality to init the 3DLayout

The function bootrap init the ezzing 3d in the container defined and with the options provided

The options for this function are:

* **container**: the DOM element with id='ezzing3d'

* **token**: the user token from the CRM

* **id**: the CRM project id. This value can also be used to activate special modes in the 3DLayout. Use id="demo" to run a 3DLayout demo with an empty project. Use id="tutorial"  to run an interactive tutorial. Use id="landing" to view an special showcase demo project.

* **failURL**: an alternative URL to redirect the user when token or id from CRM fails.

* **showcase**: When this value is true the project is opened in a special showcase mode, without graphic interface and in a nice 3d view. This mode is read-only and the project can not be modified.

***
    Integration in a non-angular platform
    - No deberíamos decir que son copiar los archivos ya que los mismos se cargaran con un cdn y no los copiara el usuario en ningun sitio

    HTML code
    - En cuanto al html code si decimos antes que lo cargamos con un cdn no debemos mencionar aquí lo de poner esas lineas
