
cmake_minimum_required(VERSION 3.14)

project(cfg_helper)

#设置编译器标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

 
# 设置编译选项
option(ENABLE_CROSS_COMPILE "Enable cross-compile for specific platform" ON)

# 添加编译器选项
if(ENABLE_CROSS_COMPILE)
   include(/opt/luck_toolchain/arm-rockchip830-linux-uclibcgnueabihf/arm-toolchain.cmake)
   set(CMAKE_SYSTEM_NAME Linux)
   set(CMAKE_SYSTEM_PROCESSOR arm)
   set(CMAKE_C_COMPILER arm-rockchip830-linux-uclibcgnueabihf-gcc)
   set(CMAKE_CXX_COMPILER arm-rockchip830-linux-uclibcgnueabihf-g++)
   set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
   set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
   set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
   set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
endif()
 

# 添加头文件
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    elog4cpp/include
)



# 添加源文件
set(SOURCES
    main.cpp
)
 
# 添加可执行文件
add_executable(cfg_helper main.cpp)



if(ENABLE_CROSS_COMPILE)
target_link_directories(cfg_helper PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/elog4cpp/lib/arm)
 message(STATUS "link_directories ${CMAKE_CURRENT_SOURCE_DIR}/elog4cpp/lib/arm")    
else()
  target_link_directories(cfg_helper PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/elog4cpp/lib/x86)
  message(STATUS "link_directories ${CMAKE_CURRENT_SOURCE_DIR}/elog4cpp/lib/x86")
endif()
#链接 elog库
target_link_libraries(cfg_helper elog)
target_link_libraries(cfg_helper ejson)
target_link_libraries(cfg_helper pthread)
target_link_libraries(cfg_helper fmt)