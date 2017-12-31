'use strict'

require('./index.html');
require('./style.css');

const elm = require('./Elm/Main.elm');
const mountNode = document.getElementById('main');

const app = elm.Main.embed(mountNode);