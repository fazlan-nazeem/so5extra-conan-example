This repository contains a couple of simple examples those use [so_5_extra](https://stiffstream.com/en/products/so_5_extra.html) via the corresponding Conan package.

# How To Try

## Docker
The simplest way is to use Docker and Dockerfile from the repository. For example:
```bash
git clone https://github.com/Stiffstream/so5extra-conan-example
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
# Add remote for conan to find so5extra package.
conan remote add stiffstream https://api.bintray.com/conan/stiffstream/public
# Add remote for conan to find Asio package.
conan remote add public-conan https://api.bintray.com/conan/bincrafters/public-conan  
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

