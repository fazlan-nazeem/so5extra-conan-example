FROM ubuntu:18.10

# Prepare build environment
RUN apt-get update && \
    apt-get -qq -y install gcc g++ \
    cmake curl wget pkg-config \
    libtool
RUN apt-get -qq -y install python3
RUN apt-get -qq -y install python3-pip
RUN pip3 install conan
RUN conan remote add stiffstream https://api.bintray.com/conan/stiffstream/public
RUN conan remote add public-conan https://api.bintray.com/conan/bincrafters/public-conan  

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

