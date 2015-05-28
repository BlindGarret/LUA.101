cmake_minimum_required(VERSION 3.2)
project(CppIntegration)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

#Common Path Locations
set(INCLUDE_DIR Source/Common/include)
set(LIB_DIR Source/Common/lib)

#directories
include_directories(${INCLUDE_DIR})
link_directories(${LIB_DIR} ${LIB_DIR}/LUA)

#header file Declarations
set(HEADERS ${LUA_HEADERS})
set(LUA_HEADERS ${INCLUDE_DIR}/lauxlib.h
                ${INCLUDE_DIR}/lua.h
                ${INCLUDE_DIR}/lua.hpp
                ${INCLUDE_DIR}/luaconf.h
                ${INCLUDE_DIR}/lualib.h)

#library declarations
set(LIBRARIES lua)

#Code File Declarations
set(CODE_FILES Source/main.cpp)

# Add the Executable
set(SOURCE_FILES ${HEADERS} ${CODE_FILES})
add_executable(CppIntegration ${SOURCE_FILES})

target_link_libraries(CppIntegration ${LIBRARIES})
