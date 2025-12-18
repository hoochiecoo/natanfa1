cmake_minimum_required(VERSION 3.10)
project(hello)

add_library(
    hello-lib
    SHARED
    hello.c
)

find_library(
    log-lib
    log
)

target_link_libraries(
    hello-lib
    ${log-lib}
)
