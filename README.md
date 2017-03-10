# Dockerfiles for Swift

![](Dockerfiles.jpg)

[![Docker Version](https://img.shields.io/badge/Docker-17.03-6193DF.svg)](https://github.com/docker/docker)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-16.04-6193DF.svg)](https://store.docker.com/images/414e13de-f1ba-40d0-9867-08f2e5884b3f?tab=description)
[![Swift Version](https://img.shields.io/badge/Swift-3.0.2-orange.svg)](https://swift.org/download/)
[![Vapor Toolbox](https://img.shields.io/badge/Vapor Toolbox-1.0.6-orange.svg)](https://github.com/vapor/toolbox)
[![Vapor](https://img.shields.io/badge/Vapor-1.5.9-orange.svg)](https://github.com/vapor/vapor)
![Plaform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

Collection of Dockerfiles to create Swift 3 environments on Ubuntu 16.04 for developers

## Table of contents

* [Docker](#docker)
  * [What is Docker?](#what-is-a-dockerfile)
  * [What is a `Dockerfile`?](#what-is-a-dockerfile)
  * [Install Docker on Mac](#install-docker-on-mac)
* [Docker Images](#docker-images)
  * [Install environment](#install-environment)
* [Basic Images](#basic-images)
  * [`clang` image](#clang-image)
  * [`swift3` image](#swift3-image)
* [Vapor Images](#vapor-images)
  * [`vapor` image](#vapor-image)
  * [`vapor-mysql` image](#vapor-mysql-image)
  * [`vapor-postgresql` image](#vapor-postgresql-image)
  * [`vapor-sqlite` image](#vapor-sqlite-image)
* [To build all images](#to-build-all-images)
* [Images on the cloud](#images-on-the-cloud)
* [Resources](#resources)

--

## Docker

### What is Docker?
Docker is an open-source project that automates the deployment of Linux applications inside software containers

### What is a `Dockerfile`?
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

All images are built in the `Dockerfiles` folder

## Basic Images

### `clang` image

* Image base on: `ubuntu:16.04`
* Instruction to build: `docker build -t clang clang/`
* Description: Create an image with the `clang` environment

### `swift3` image

* Image base on: `ubuntu:16.04 ► clang`
* Instruction to build: `docker build -t swift3 swift3/`
* Description: Install the Swift 3.0.2 environment on Linux. Can be used to build all Swift 3 applications on Linux.

```
$ docker run -ti --rm \
                 --name swift3 \
                 swift3

root@d712e29a31df:/# swift --version
Swift version 3.0.2 (swift-3.0.2-RELEASE)
Target: x86_64-unknown-linux-gnu
```

## Vapor Images

[Vapor](https://vapor.codes/) is web framework for Swift work on macOS and Ubuntu

If you have your vapor sources projects are on`/Volumes/Sources/vapor/projects` you must declare this folder in the `File Sharing` like this:

![image](https://cloud.githubusercontent.com/assets/1082222/20648514/a84229a0-b4a9-11e6-9ef5-ed31d1fbab4c.png)

### `vapor` image

* Image base on: `ubuntu:16.04 ► clang ► swift3`
* Instruction to build: `docker build -t vapor vapor/`
* Description: Download and compiled vapor on Linux. Can be used by a developer to develop web site or/and REST Api.


On your Mac open `Terminal` and enter the following command. You will launch the container and map `/Volumes/Sources/vapor/projects` to `/vapor` on the container: 

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor \
                 -p 127.0.0.1:8080:8080 \
                 -v $(pwd)/vapor/projects:/vapor \
                 vapor
```

On the container to build your project (replace `ItWorks` by your project):

```
root@0f8de5949871:/vapor# cd ItWorks/
root@0f8de5949871:/vapor/ItWorks# # If you update `package.swift` you must execute
root@0f8de5949871:/vapor/ItWorks# vapor build --clean
root@0f8de5949871:/vapor/ItWorks# # Otherwise just execute
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

To test your project on your Mac open the browser and enter the url: `http://localhost:8080/`
![image](https://cloud.githubusercontent.com/assets/1082222/20866179/928fe03e-ba26-11e6-87fd-09b419a69a95.png)

--

### `vapor-mysql` image

* Image base on: `ubuntu:16.04 ► clang ► swift3 ► vapor`
* Instruction to build: `docker build -t vapor-mysql vapor-mysql/`
* Description: Install mysql on the container, pre-create `vapor` database and `vapor` user (without password)

On your Mac open `Terminal` and enter the following command. You will launch the container and map `/Volumes/Sources/vapor-mysql/projects` to `/vapor` on the container: 

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor-mysql \
                 -p 127.0.0.1:8080:8080 \
                 -p 127.0.0.1:3306:3306 \
                 -v mysql.data:/var/lib/mysql \
                 -v $(pwd)/vapor-mysql/projects:/vapor \
                 vapor-mysql
                 
 * Starting MySQL database server mysqld                                 [ OK ]
root@3922aa89091f:/vapor#
```

On the container to build your project (replace `ItWorks-MySQL` by your project):

```
root@3922aa89091f:/vapor# cd ItWorks-MySQL/
root@3922aa89091f:/vapor/ItWorks-MySQL# # If you update `package.swift` you must execute
root@3922aa89091f:/vapor/ItWorks-MySQL# vapor build --clean
root@3922aa89091f:/vapor/ItWorks-MySQL# # Otherwise just execute
root@3922aa89091f:/vapor/ItWorks-MySQL# vapor build
No Packages folder, fetch may take a while...
Fetching Dependencies [Done]
Building Project [Done]
root@3922aa89091f:/vapor/ItWorks-MySQL#
```

To run your project on the container:

```
root@3922aa89091f:/vapor/ItWorks-MySQL# vapor run serve
Running ItWorks-MySQL...
No preparations.
Server 'default' starting at 0.0.0.0:8080
GET /version
```

To test your project on your Mac open the browser and enter the url: `http://localhost:8080/version`
![image](https://cloud.githubusercontent.com/assets/1082222/20866147/9a95baac-ba25-11e6-9f4e-5a5732d80f9b.png)

If you run the following command you should see:

```
$ docker volume ls
DRIVER              VOLUME NAME
local               mysql.data
```

`mysql.data` is a data volume. All changes on `/var/lib/mysql` on the container will be persistent.

### `vapor-postgresql` image

* Image base on: `ubuntu:16.04 ► clang ► swift3 ► vapor`
* Instruction to build: `docker build -t vapor-postgresql vapor-postgresql/`
* Description: Install PostgreSQL on the container, pre-create `vapor` database and `vapor` user (without password)

On your Mac open `Terminal` and enter the following command. You will launch the container and map `/Volumes/Sources/vapor-mysql/projects` to `/vapor` on the container: 

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor-postgresql \
                 -p 127.0.0.1:8080:8080 \
                 -p 127.0.0.1:5432:5432 \
                 -v postgresql.data:/var/lib/postgresql/9.5/main \
                 -v $(pwd)/vapor-postgresql/projects:/vapor \
                 vapor-postgresql
                 
 * Starting PostgreSQL 9.5 database server                               [ OK ]
root@99222e9cb4ac:/vapor#
```

On the container to build your project (replace `ItWorks-PostgreSQL` by your project):

```
root@99222e9cb4ac:/vapor# cd ItWorks-PostgreSQL/
root@99222e9cb4ac:/vapor/ItWorks-PostgreSQL# # If you update `package.swift` you must execute
root@99222e9cb4ac:/vapor/ItWorks-PostgreSQL# vapor build --clean
root@99222e9cb4ac:/vapor/ItWorks-PostgreSQL# # Otherwise just execute
root@99222e9cb4ac:/vapor/ItWorks-PostgreSQL# vapor build
No Packages folder, fetch may take a while...
Fetching Dependencies [Done]
Building Project [Done]
root@99222e9cb4ac:/vapor/ItWorks-PostgreSQL#
```

To run your project on the container:

```
root@99222e9cb4ac:/vapor/ItWorks-PostgreSQL# vapor run serve
Running ItWorks-PostgreSQL...
No preparations.
Server 'default' starting at 0.0.0.0:8080
GET /version
```

To test your project on your Mac open the browser and enter the url: `http://localhost:8080/version`
![image](https://cloud.githubusercontent.com/assets/1082222/20864528/8e662ea4-b9f5-11e6-9c57-c74cbe5504c2.png)

If you run the following command you should see:

```
$ docker volume ls
DRIVER              VOLUME NAME
local               progresql.data
```

`progresql.data` is a data volume. All changes on `/var/lib/postgresql/9.5/main` on the container will be persistent.

### `vapor-sqlite` image

* Image base on: `ubuntu:16.04 ► clang ► swift3 ► vapor`
* Instruction to build: `docker build -t vapor-sqlite vapor-sqlite/`
* Description: Install PostgreSQL on the container, pre-create `vapor` database and `vapor` user (without password)

On your Mac open `Terminal` and enter the following command. You will launch the container and map `/Volumes/Sources/vapor-sqlite/projects` to `/vapor` on the container: 

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor-sqlite \
                 -p 127.0.0.1:8080:8080 \
                 -v $(pwd)/vapor-sqlite/projects:/vapor \
                 vapor-sqlite
root@c05cd630ea61:/vapor#
```

On the container to build your project (replace `ItWorks-Sqlite ` by your project):

```
root@c05cd630ea61:/vapor# cd ItWorks-Sqlite/
root@c05cd630ea61:/vapor/ItWorks-Sqlite# # If you update `package.swift` you must execute
root@c05cd630ea61:/vapor/ItWorks-Sqlite# vapor build --clean
root@c05cd630ea61:/vapor/ItWorks-Sqlite# # Otherwise just execute
root@c05cd630ea61:/vapor/ItWorks-Sqlite# vapor build
No Packages folder, fetch may take a while...
Fetching Dependencies [Done]
Building Project [Done]
root@c05cd630ea61:/vapor/ItWorks-Sqlite#
```

To run your project on the container:

```
root@c05cd630ea61:/vapor/ItWorks-Sqlite# vapor run serve
Running ItWorks-Sqlite...
No preparations.
Server 'default' starting at 0.0.0.0:8080
GET /version
```

To test your project on your Mac open the browser and enter the url: `http://localhost:8080/version`
![image](https://cloud.githubusercontent.com/assets/1082222/20866121/f1f6f7bc-ba24-11e6-9449-aab5b22ae7c7.png)

## To build all images

Execute command

```bash
$ ./build --image=all 
```

This script will build `clang`, `swift3` and all `vapor` images

## Images on the cloud

All images are avalaible on [Docker Store](https://store.docker.com/search?q=tofdocker&source=community):

[![image](https://cloud.githubusercontent.com/assets/1082222/21267052/e9ec719a-c3a8-11e6-9bbe-28979d6a622a.png)](https://store.docker.com/search?q=tofdocker&source=community)

### Run `clang` image from the cloud

```
$ docker run -ti --rm \
                 --name clang \
                 tofdocker/clang:1.2
```
### Run `swift3` image from the cloud

```
$ docker run -ti --rm \
                 --name swift3 \
                 tofdocker/swift3:1.2
```

### Run `vapor` image from the cloud

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor \
                 -p 127.0.0.1:8080:8080 \
                 -v $(pwd)/vapor/projects:/vapor \
                 tofdocker/vapor:1.4
```

### Run `vapor-mysql` image from the cloud

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor-mysql \
                 -p 127.0.0.1:8080:8080 \
                 -p 127.0.0.1:3306:3306 \
                 -v mysql.data:/var/lib/mysql \
                 -v $(pwd)/vapor-mysql/projects:/vapor \
                 tofdocker/vapor-mysql:1.4
```

### Run `vapor-postgresql ` image from the cloud

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor-postgresql \
                 -p 127.0.0.1:8080:8080 \
                 -p 127.0.0.1:5432:5432 \
                 -v postgresql.data:/var/lib/postgresql/9.5/main \
                 -v $(pwd)/vapor-postgresql/projects:/vapor \
                 tofdocker/vapor-postgresql:1.4
```

### Run `vapor-sqlite ` image from the cloud

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor-sqlite \
                 -p 127.0.0.1:8080:8080 \
                 -v $(pwd)/vapor-sqlite/projects:/vapor \
                 tofdocker/vapor-sqlite:1.4
```

## Resources

If you are interested with **Swift backend** I invite you to visit my collection on Google+: [Swift Backend](https://goo.gl/PT0dec). You will find articles and tutorials on Vapor for example 😉
