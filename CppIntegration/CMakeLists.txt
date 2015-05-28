cmake_minimum_required(VERSION 3.2)
project(CppIntegration)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libgcc -static-libstdc++") #important to ensure we don't need to include these dlls
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Bin/Debug)

#Common Path Locations
set(INCLUDE_DIR Source/Common/include)
set(LIB_DIR Source/Common/lib)

#directories
include_directories(${INCLUDE_DIR})
link_directories(${LIB_DIR})

#header file Declarations
set(HEADERS ${LUA_HEADERS})
set(LUA_HEADERS ${INCLUDE_DIR}/lauxlib.h
                ${INCLUDE_DIR}/lua.h
                ${INCLUDE_DIR}/lua.hpp
                ${INCLUDE_DIR}/luaconf.h
                ${INCLUDE_DIR}/lualib.h)

#library declarations
set(LIBRARIES lua)
list( APPEND EXTERNAL_SHARED_LIBRARIES ${LIB_DIR}/liblua.dll.a )

#Code File Declarations
set(CODE_FILES Source/main.cpp)

# Add the Executable
set(SOURCE_FILES ${HEADERS} ${CODE_FILES})
add_executable(CppIntegration ${SOURCE_FILES})

target_link_libraries(CppIntegration ${LIBRARIES})

#post build steps
message( STATUS "\t Copying shared libraries!")
file( COPY ${EXTERNAL_SHARED_LIBRARIES} DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} NO_SOURCE_PERMISSIONS)
