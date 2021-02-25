cmake_minimum_required(VERSION 3.8)

project(so5extra_examples CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(delivery_receipt delivery_receipt.cpp)

target_link_libraries(delivery_receipt ${CONAN_LIBS})

add_executable(asio_tp_hello_world asio_tp_hello_world.cpp)

target_link_libraries(asio_tp_hello_world ${CONAN_LIBS})
if(WIN32)
	target_link_libraries(asio_tp_hello_world wsock32 ws2_32)
endif()

