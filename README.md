# Dockerfiles

Collection of Dockerfiles to create Swift 3 environment on Ubuntu 16.04

## Instructions
Execute command
```bash
$ . build
```
This script will build `clang` and `swift3`

- **`clang` image**: `clang` is base on `ubuntu16.04` image and install the clang environment
- **`swift3` image**: `swift3` is base on `clang` image and install swift 3.0.1
