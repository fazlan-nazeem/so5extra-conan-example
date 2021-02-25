This repository contains a couple of simple examples those use [so5extra](https://github.com/Stiffstream/so5extra) via the corresponding Conan package.

# How To Try

## Docker
The simplest way is to use Docker and Dockerfile from the repository. For example:
```bash
cd so5extra-conan-example
docker build -t so5-conan-example .
docker run -it so5-conan-example /bin/bash
./so5extra-conan-example/build/bin/delivery_receipt
./so5extra-conan-example/build/bin/asio_tp_hello_world
exit
```
All necessary steps like installing Python, PIP, conan, CMake and so on are performed in Dockerfile. You can inspect Dockerfile content to see how conan can be configured and used.

## Manual Build
To perform manual build it is necessary to have conan and CMake installed. Then you can do the following steps:
```bash
# Clone the demo repository.
git clone https://github.com/Stiffstream/so5extra-conan-example
cd so5extra-conan-example
# Build the example.
mkdir build && cd build
conan install .. --build=missing
cmake ..
cmake --build . --config Release
# Check the example.
./bin/delivery_receipt
./bin/asio_tp_hello_world
```

Please note that the following commands maybe necessary too:

```bash
RUN conan profile new default --detect
RUN conan profile update settings.compiler.libcxx=libstdc++11 default
```

They have to be issued just before calling `conan install`.

