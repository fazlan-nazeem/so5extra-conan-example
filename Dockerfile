FROM ubuntu:20.04@sha256:0b5642e51a93c43da14d8c0322b43739abaa1ddd8b15f2c811175e42b6340d72

# Prepare build environment
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get -qq -y install gcc g++ \
    cmake curl wget pkg-config \
    libtool
RUN apt-get -qq -y install python3
RUN apt-get -qq -y install python3-pip
RUN pip3 install conan==1.60.2
RUN conan profile new default --detect
RUN conan profile update settings.compiler.libcxx=libstdc++11 default

RUN mkdir so5extra-conan-example
COPY *.cpp so5extra-conan-example/
COPY conanfile.txt so5extra-conan-example
COPY CMakeLists.txt so5extra-conan-example

RUN echo "*** Building an example ***" \
	&& cd so5extra-conan-example \
	&& mkdir build \
	&& cd build \
	&& conan install .. --build=missing \
	&& cmake .. \
	&& cmake --build . --config Release

