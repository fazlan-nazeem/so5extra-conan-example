cmake_minimum_required(VERSION 2.8)

project(so5extra_examples)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

find_package(so5extra CONFIG REQUIRED)
find_package(sobjectizer CONFIG REQUIRED)

add_executable(delivery_receipt delivery_receipt.cpp)

target_link_libraries(delivery_receipt sobjectizer::StaticLib)
target_link_libraries(delivery_receipt sobjectizer::so5extra)

add_executable(asio_tp_hello_world asio_tp_hello_world.cpp)

target_link_libraries(asio_tp_hello_world sobjectizer::StaticLib)
target_link_libraries(asio_tp_hello_world sobjectizer::so5extra)
if(WIN32)
	target_link_libraries(asio_tp_hello_world wsock32 ws2_32)
endif()