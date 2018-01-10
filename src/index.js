'use strict'

require('./index.html');
require('./style.css');

const elm = require('./Elm/Main.elm');
const mountNode = document.getElementById('main');

const app = elm.Main.embed(mountNode);

app.ports.createDownloadUrl.subscribe(str => {
    const blob = new Blob([ str ], { "type": "text/json" });
    window.URL = window.URL || window.webkitURL;
    app.ports.getDownloadUrl.send(window.URL.createObjectURL(blob));
});