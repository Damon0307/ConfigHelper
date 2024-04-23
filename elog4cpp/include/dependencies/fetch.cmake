#include(FetchContent)
include(${PROJECT_SOURCE_DIR}/cmake/CPM.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/target_if_include.cmake)
target_if_include(fmt  ${CMAKE_CURRENT_LIST_DIR}/fmt/fetch_fmt.cmake)
target_if_include(ejson  ${CMAKE_CURRENT_LIST_DIR}/ejson4cpp/fetch_ejson4cpp.cmake)