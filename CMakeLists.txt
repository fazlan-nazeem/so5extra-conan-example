cmake_minimum_required(VERSION 2.8)

project(so5extra_examples)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

find_package(so5extra CONFIG REQUIRED)
find_package(sobjectizer CONFIG REQUIRED)

add_executable(delivery_receipt delivery_receipt.cpp)

target_link_libraries(delivery_receipt sobjectizer::StaticLib)
target_link_libraries(delivery_receipt sobjectizer::so5extra)

install(TARGETS ${SAMPLE} DESTINATION bin)
