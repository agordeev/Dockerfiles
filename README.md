# Dockerfiles

![](Dockerfiles.jpg)

![Ubuntu](https://img.shields.io/badge/Ubuntu-16.04-6193DF.svg)
![Swift Version](https://img.shields.io/badge/Swift-3.0.1-orange.svg) 
![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg) 
![Plaform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)

Collection of Dockerfiles to create Swift 3 environments on Ubuntu 16.04

## Instructions
Execute command
```bash
$ . build
```
This script will build `clang`, `swift3` and `vapor` docker images

- **`clang` image**: `clang` is base on `ubuntu:16.04` image and install the clang environment
- **`swift3` image**: `swift3` is base on `clang` image and install swift 3.0.1
- **`vapor` image**: `vapor` is base on `swift3` image and install Vapor Toolbox v1.0.3 

