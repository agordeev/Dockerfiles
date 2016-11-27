# Dockerfiles for Swift

![](Dockerfiles.jpg)

![Docker Version](https://img.shields.io/badge/Docker-1.12.3-6193DF.svg) 
![Ubuntu](https://img.shields.io/badge/Ubuntu-16.04-6193DF.svg)
![Swift Version](https://img.shields.io/badge/Swift-3.0.1-orange.svg) 
![Vapor Toolbox](https://img.shields.io/badge/Vapor Toolbox-1.0.3-orange.svg) 
![Vapor Framework](https://img.shields.io/badge/Vapor Framework-1.1.12-orange.svg) 
![Plaform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)
![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg) 

Collection of Dockerfiles to create Swift 3 environments on Ubuntu 16.04

## Docker

### What is Docker?
Docker is an open-source project that automates the deployment of Linux applications inside software containers

### What is Dockerfile
Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Using docker build users can create an automated build that executes several command-line instructions in succession.

### Install Docker on Mac
Since June 20th, 2016, Docker for Mac is available. 

[![image](https://cloud.githubusercontent.com/assets/1082222/20647416/13d64d92-b494-11e6-9386-cb1f3223584f.png)](https://docs.docker.com/docker-for-mac/) 

(just click on the image and follow the instructions)

## Docker Images

### Install environment

You just have to clone this repository:
```bash
$ git clone https://github.com/TofPlay/Dockerfiles
```

All images are build on `Dockerfiles` folder

-- 
### Basic Images

#### `clang` image

* Image base on: `ubuntu:16:04`
* Instruction to build: `docker build -t clang clang/`
* Description: Create an image with the `clang` environment

#### `swift3` image

* Image base on: `ubuntu:16:04 ➤ clang`
* Instruction to build: `docker build -t swift3 swift3/`
* Description: Install the Swift 3.0.1 environment on Linux. Can be used all Swift 3 applications on Linux.

-- 
### Vapor Images

[Vapor](https://vapor.codes/) is web framework for Swift work on macOS and Ubuntu

#### `vapor` image

* Image base on: `ubuntu:16:04 ➤ clang ➤ swift3`
* Instruction to build: `docker build -t vapor vapor/`
* Description: Download and compiled vapor on Linux. Can be used by a developer to develop web site or/and REST Api.


If you have your vapor projects are on`/Volumes/Sources/vapor/projects` you must declare in the `File Sharing` like this:

![image](https://cloud.githubusercontent.com/assets/1082222/20648514/a84229a0-b4a9-11e6-9ef5-ed31d1fbab4c.png)



On your Mac open Terminal and enter the following command, you will map `/Volumes/Sources/vapor/projects` to `/vapor` on the container: 
```
$ docker run -ti --name vapor --rm -p 127.0.0.1:8080:8080 -v /Volumes/Sources/vapor/projects:/vapor vapor
```

On the container to build your project (replace `ItWorks` by your project):

```
root@0f8de5949871:/vapor# cd ItWorks/
root@0f8de5949871:/vapor/ItWorks# vapor build
Fetching Dependencies [Done]
Building Project [Done]
```

To run your project on the container:

```
root@0f8de5949871:/vapor/ItWorks# vapor run serve
Running ItWorks...
No preparations.
Server 'default' starting at 0.0.0.0:8080
```

To test your project on your Mac on the browser to the url: `http://localhost:8080/`
![image](https://cloud.githubusercontent.com/assets/1082222/20648568/015f21ea-b4ab-11e6-982a-d354f2bf1f19.png)

#### `vapor-mysql` image

Coming soon...

#### `vapor-postgresql` image

Coming soon...

#### `vapor-sqlite` image

Coming soon...

-- 
### To build all images

Execute command

```bash
$ . build
```

This script will build `clang`, `swift3` and all `vapor` images
