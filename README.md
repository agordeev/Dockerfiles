# Dockerfiles for Swift

[![Docker Version](https://img.shields.io/badge/Docker-17.09.0-6193DF.svg)](https://github.com/docker/docker)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-16.10-6193DF.svg)](https://store.docker.com/images/414e13de-f1ba-40d0-9867-08f2e5884b3f?tab=description)
[![Swift Version](https://img.shields.io/badge/Swift-4.0.2-orange.svg)](https://swift.org/download/)
[![Vapor Toolbox](https://img.shields.io/badge/Vapor%20Toolbox-3.1.2-orange.svg)](https://github.com/vapor/toolbox)
[![Vapor](https://img.shields.io/badge/Vapor-2.3.0-orange.svg)](https://github.com/vapor/vapor)
![Plaform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

![](https://user-images.githubusercontent.com/1082222/32498908-503c58f6-c3d1-11e7-9964-d075841be004.jpg)

[![Branch Ubuntu 16.10 & Swift 4.0.2 & Vapor 2](https://img.shields.io/badge/Branch-Ubuntu%2016.10%20%2B%20Swift%204.0.2%20%2B%20Vapor%202-blue.svg)](https://github.com/TofPlay/Dockerfiles)
[![Branch Ubuntu 16.10 & Swift 3.1.1 & Vapor 2](https://img.shields.io/badge/Branch-Ubuntu%2016.10%20%2B%20Swift%203.1.1%20%2B%20Vapor%202-lightgrey.svg)](https://github.com/TofPlay/Dockerfiles/tree/ubuntu1610_swift311_vapor2)
[![Branch Ubuntu 16.10 & Swift 3.1.1 & Vapor 1](https://img.shields.io/badge/Branch-Ubuntu%2016.10%20%2B%20Swift%203.1.1%20%2B%20Vapor%201-lightgrey.svg)](https://github.com/TofPlay/Dockerfiles/tree/ubuntu1610_swift31_vapor1)
[![Branch Ubuntu 16.04 & Swift 3.0.2 & Vapor 1](https://img.shields.io/badge/Branch-Ubuntu%2016.04%20%2B%20Swift%203.0.2%20%2B%20Vapor%201-lightgrey.svg)](https://github.com/TofPlay/Dockerfiles/tree/ubuntu1604_swift3_vapor1)

Collection of Dockerfiles to create Swift 4.0.2 environments on Ubuntu 16.10 for developers

---

## Table of contents

* [Docker](#docker)
  * [What is Docker?](#what-is-a-dockerfile)
  * [What is a `Dockerfile`?](#what-is-a-dockerfile)
  * [Install Docker on Mac](#install-docker-on-mac)
* [Docker Images](#docker-images)
  * [Install environment](#install-environment)
* [Basic Images](#basic-images)
  * [`clang` image](#clang-image)
  * [`swift4` image](#swift4-image)
  * [`swift31` image](#swift31-image)
* [Vapor Images](#vapor-images)
  * [`vapor` image](#vapor-image)
  * [`vapor-mysql` image](#vapor-mysql-image)
  * [`vapor-postgresql` image](#vapor-postgresql-image)
  * [`vapor-sqlite` image](#vapor-sqlite-image)
* [To build all images](#to-build-all-images)
* [Images on the cloud](#images-on-the-cloud)
* [Resources](#resources)

---

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

* Image base on: `ubuntu:16.10`
* Instruction to build: `./build --image=clang`
* Description: Create an image with the `clang` environment

### `swift4` image

* Image base on: `ubuntu:16.10`
* Instruction to build: `./build --image=swift4`
* Description: Install the Swift 4.0 environment on Linux.

```
$ docker run -ti --rm \
                 --privileged=true \
                 --name swift4 \
                 -v $(pwd)/swift4/projects:/projects \
                 swift4

root@8d2c9f107b3d:/projects# swift --version
Swift version 4.0.2 (swift-4.0.2-RELEASE)
Target: x86_64-unknown-linux-gnu
```

## Vapor Images

[Vapor](https://vapor.codes/) is web framework for Swift work on macOS and Ubuntu

If you have your vapor sources projects are on`/Volumes/Sources/vapor/projects` you must declare this folder in the `File Sharing` like this:

![image](https://cloud.githubusercontent.com/assets/1082222/20648514/a84229a0-b4a9-11e6-9ef5-ed31d1fbab4c.png)

### `vapor` image

* Swift version: 4.0.2
* Image base on: `ubuntu:16.10`
* Instruction to build: `./build --image=vapor`
* Project generate with: `vapor new ItWorks --web`
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
root@0f8de5949871:/vapor/ItWorks# # If you update `Package.swift` you must execute
root@0f8de5949871:/vapor/ItWorks# vapor build --clean
root@0f8de5949871:/vapor/ItWorks# # Otherwise just execute
root@0f8de5949871:/vapor/ItWorks# vapor build 
Fetching Dependencies [Done]
Building Project [Done]
```

To run your project on the container:

```
root@5a8d6cc0cdc7:/vapor/ItWorks# vapor run serve
Running ItWorks ...
The current hash key "0000000000000000" is not secure.
Update hash.key in Config/crypto.json before using in production.
Use `openssl rand -base64 <length>` to generate a random string.
The current cipher key "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=" is not secure.
Update cipher.key in Config/crypto.json before using in production.
Use `openssl rand -base64 32` to generate a random string.
Starting server on 0.0.0.0:8080
GET /
GET /styles/app.css
GET /images/it-works.png
```

To test your project on your Mac open the browser and enter the url: [http://localhost:8080/](http://localhost:8080/)
![image](https://cloud.githubusercontent.com/assets/1082222/26242335/59810298-3c88-11e7-8b65-106ca873bac6.png)

### `vapor-mysql` image

* Swift version: 4.0.2
* Image base on: `ubuntu:16.10 ► vapor`
* Instruction to build: `./build --image=vapor-mysql`
* Project generate with: `vapor new ItWorks-MySQL --api`
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
root@3922aa89091f:/vapor/ItWorks-MySQL# # If you update `Package.swift` you must execute
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
root@f4d20b98868b:/vapor/ItWorks-MySQL# vapor run serve
Running ItWorks-MySQL ...
The current hash key "0000000000000000" is not secure.
Update hash.key in Config/crypto.json before using in production.
Use `openssl rand -base64 <length>` to generate a random string.
The current cipher key "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=" is not secure.
Update cipher.key in Config/crypto.json before using in production.
Use `openssl rand -base64 32` to generate a random string.
Database prepared
Starting server on 0.0.0.0:8080
GET /
```

To test your project on your Mac open the browser and enter the url: [http://localhost:8080/](http://localhost:8080/)
![image](https://cloud.githubusercontent.com/assets/1082222/26356473/6c3c44b4-3fcc-11e7-9b62-d9b316f29d77.png)

If you run the following command you should see:

```
$ docker volume ls
DRIVER              VOLUME NAME
local               mysql.data
```

`mysql.data` is a data volume. All changes on `/var/lib/mysql` on the container will be persistent.

### `vapor-postgresql` image

* Swift version: 4.0.2
* Image base on: `ubuntu:16.10 ► vapor`
* Instruction to build: `./build --image=vapor-postgresql`
* Project generate with: `vapor new ItWorks-PostgreSQL --api`
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
root@99222e9cb4ac:/vapor/ItWorks-PostgreSQL# # If you update `Package.swift` you must execute
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
Running ItWorks-PostgreSQL ...
The current hash key "0000000000000000" is not secure.
Update hash.key in Config/crypto.json before using in production.
Use `openssl rand -base64 <length>` to generate a random string.
The current cipher key "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=" is not secure.
Update cipher.key in Config/crypto.json before using in production.
Use `openssl rand -base64 32` to generate a random string.
Database prepared
Starting server on 0.0.0.0:8080
```

To test your project on your Mac open the browser and enter the url: [http://localhost:8080/](http://localhost:8080/)`
![image](https://cloud.githubusercontent.com/assets/1082222/26357361/564f4ebe-3fcf-11e7-9770-e220a6a8b12d.png)

If you run the following command you should see:

```
$ docker volume ls
DRIVER              VOLUME NAME
local               progresql.data
```

`progresql.data` is a data volume. All changes on `/var/lib/postgresql/9.5/main` on the container will be persistent.

### `vapor-sqlite` image

* Swift version: 4.0.2
* Image base on: `ubuntu:16.10 ► vapor`
* Instruction to build: `./build --image=vapor-sqlite`
* Project generate with: `vapor new ItWorks-Sqlite --template=api`
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
root@c05cd630ea61:/vapor/ItWorks-Sqlite# # If you update `Package.swift` you must execute
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
root@3c9afdb27d56:/vapor/ItWorks-Sqlite# vapor run serve
Running ItWorks-Sqlite ...
The current hash key "0000000000000000" is not secure.
Update hash.key in Config/crypto.json before using in production.
Use `openssl rand -base64 <length>` to generate a random string.
The current cipher key "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=" is not secure.
Update cipher.key in Config/crypto.json before using in production.
Use `openssl rand -base64 32` to generate a random string.
Database prepared
Starting server on 0.0.0.0:8080
```

To test your project on your Mac open the browser and enter the url: [http://localhost:8080/](http://localhost:8080/)
![image](https://cloud.githubusercontent.com/assets/1082222/26355597/9313c056-3fc9-11e7-9842-b8c1167bdd25.png)

## To build all images

Execute command

```bash
$ ./build --image=all 
```

This script will build `clang`, `swift3` and all `vapor` images

## Images on the cloud

All images are avalaible on [Docker Hub](https://hub.docker.com/u/tofdocker/):

[![image](https://user-images.githubusercontent.com/1082222/30006285-5c52330e-90f5-11e7-9e80-4def0b2f16ae.png)](https://hub.docker.com/u/tofdocker/)

### Run `clang` image from the cloud

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name clang \
                 -v $(pwd)/clang/projects:/projects \
                 tofdocker/clang:1.6
```
### Run `swift4` image from the cloud (Beta version)

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name swift4 \
                 -v $(pwd)/swift4/projects:/projects \
                 --privileged=true \
                 tofdocker/swift4:1.0
```

### Run `vapor` image from the cloud

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor \
                 -p 127.0.0.1:8080:8080 \
                 -v $(pwd)/vapor/projects:/vapor \
                 --privileged=true \
                 tofdocker/vapor:1.9
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
                 --privileged=true \
                 tofdocker/vapor-mysql:1.9
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
                 --privileged=true \
                 tofdocker/vapor-postgresql:1.9
```

### Run `vapor-sqlite ` image from the cloud

```
$ pwd
/Volumes/Sources/
$ docker run -ti --rm \
                 --name vapor-sqlite \
                 -p 127.0.0.1:8080:8080 \
                 -v $(pwd)/vapor-sqlite/projects:/vapor \
                 --privileged=true \
                 tofdocker/vapor-sqlite:1.9
```

## Resources

If you are interested with **Swift backend** I invite you to visit my collection on Google+: [Swift Backend](https://goo.gl/PT0dec). You will find articles and tutorials on Vapor for example 😉
