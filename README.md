### Description

This project started to find a way of creating Vue.js apps with files located on the host
machine but without installing Node.js on the host machine.

All the processes of installing node and vue components happen inside those containers
but in directories mapped to the host machine.

_Currently it only works with Vue.js as this is what I am working with, but it can easily be 
adjusted to work with Angular or React_

### How
There are two parts at play:
* First a Node.js image is created as a template for all future projects
* Then using above image we create Vue.js apps
