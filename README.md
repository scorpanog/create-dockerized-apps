### Description

This project started to find a way of creating Vue.js apps with files located on the host
machine but without installing Node.js on the host machine.

All the processes of installing node and vue components happen inside those containers
but in directories mapped to the host machine.

_Currently it only works with Vue.js as this is what I am working with, but it can easily be 
adjusted to work with Angular or React_

### Whats at play
There are two parts at play:
* First a Node.js image is created as a template for all future projects
* Then using above image we create Vue.js apps

### How to use
This is setup to create project directories under a parent directory, which means all of your 
projects will have sister directory to this 'create-dockerized-apps'

First you need to create a node/basic vue image. Cd into dockerized-vue dir and run

```
docker build --tag dockerized-vue .
```

After this is done the second step is to create your Vue project
```
cd ..
./create-vue-app.sh
```
It will ask you for the project name and port that you want to assign to this Vue app. 
Ports have to be different for each app so they run properly.

When build process finishes you will have a directory with the following structure
```
your-project-directory
|-> app (this will have all your vue app related files
|-> dev.sh (running this will start up your container and vue app into dev mode)
|-> build.sh (running this will start your container and vuew into build mode)
```
**Dev mode** means hot refresh, while **Build mode** means it will create a production
ready dist directory with all the files and then exit.

_Please note_, if you are running in dev mode and need to build the app, exit the container with 
```
docker stop <your-project-name>
```
and run the build.sh file

Simply run dev to start the containder and it will be available in your browser under 
localhost:<port-specified>

### TODO
If you can create/ajust sh files to run with Angular and React so all major 
js frameworks are covered, I would appreciate that.
