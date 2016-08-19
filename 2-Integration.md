<div class="page-break"></div>

# How to use

## Api key and autentication

To start using the 3DLayout in your platform, you need to add the following script:

```
<script data-key="API_KEY_HERE" src="https://layout.ezzing.com/client.min.js"></script>
```

where you would replace `API_KEY_HERE` by an API key we provide you for your account.

## DOM element

You need an element in the body of your html page, a div where **the 3DLayout will fit inside this element**.

> This div can't be bigger than the view size, and **no scroll** has to be applied to the html page.

You should not change the ezzing3d element size (width or height) but change the size of this container div.

```
<div style='height:100vh; width: 100vw'>
    <ezzing3d id='ezzing3d'></ezzing3d>
</div>
```

## Basic functions

Adding the `client.min.js` script with a valid API Key makes available the `Ezzing3DApi` global object, which we will use to start using the 3DLayout.

The Ezzing3DApi object has the following functions:

* createLayout
* getLayout
* listLayouts
* loadLayout

### createLayout

Create a new layout with the specified information.

```
var data = {
    title: "Sevilla",
    latitude: 37.39388,
    longitude: -5.984179999999999,
    address: "Calle María Auxiliadora, 13",
    zip: "41003",
    city: "Sevilla",
    province: "Andalucía",
    country: "Spain"
};

Ezzing3DApi.createLayout(data, function(err, layoutData) {
    if (err) throw err;
    console.log(layoutData);
});
```

Which will return the information from the created layout:

```
{
  id: 1093,
  title: "Test Layout",
  address: "Calle Luis Montoto, 2",
  zip: "41003",
  city: "Sevilla",
  province: "Andalucia",
  country: "Spain",
  latitude: "37.38900730",
  longitude: "-5.98448510",
  created_at: "2016-08-18T17:15:15+0000",
  updated_at: "2016-08-19T10:14:34+0000",
  url: "http://127.0.0.1:8080/#/GXXlgzDk0rPsrdxWfDsE5Cdi9FwUrBPx7GfuxSf0::1093"
}
```

```
{
  id:,
  title:,
  address:,
  zip:,
  city:,
  province:,
  country:,
  latitude:,
  longitude:,
  created_at:,
  updated_at:,
  url: 
}
```

### getLayout

Returns a layout's information related to the given id

```
Ezzing3DApi.getLayout(id, function(err, layoutData) {
    if (err) throw err;
    console.log(layoutData);
});
```



### listLayouts

Returns a list of all your created layouts.

```
Ezzing3DApi.listLayouts(function(err, layoutData) {
    if (err) throw err;
    console.log(layoutData);
});
```

### loadLayout

Sets up the 3DLayout interface into the ezzing3D container and loads the project related to the given id.

```
Ezzing3DApi.loadLayout(id, function(err, layout, container) {
    if (err) throw err;
});
```

loadLayout can receive an `options` argument where you can setup some customizations. You can read a description of this methods in the next episode....

```
var rules = {};

Ezzing3DApi.loadLayout(id, rules, function(err, layout, container) {
    if (err) throw err;
});
```

where: 

* layout: Exposes an object with methods to interact with the 3DLayout. You can read a description of this methods in the next episode....

* container: DOM element. 
