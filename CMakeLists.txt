cmake_minimum_required(VERSION 3.20)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

project("p4-image-classifier-dashboard")

find_package(Protobuf CONFIG REQUIRED)
find_package(gRPC CONFIG REQUIRED)

# set (PROTO_SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/proto/generated"
#    CACHE PATH "Proto Files" FORCE)
set (PROTO_SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/proto/cpp"
    CACHE PATH "Proto Files" FORCE)
file(GLOB_RECURSE PROTO_SRC "${PROTO_SRC_PATH}/*.cc")
file(GLOB_RECURSE PROTO_HEADERS "${PROTO_SRC_PATH}/*.h")

set (SERVER_SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/src_cpp"
    CACHE PATH "Project Server SRC" FORCE)
file(GLOB_RECURSE SERVER_SRC CMAKE_CONFIGURE_DEPENDS "${SERVER_SRC_PATH}/*.[ch]pp")
add_executable (dashboard "dashboard.cpp" "dashboard.h" ${PROTO_SRC} ${PROTO_HEADERS} ${SERVER_SRC})

target_include_directories(dashboard PUBLIC "${PROTO_SRC_PATH}")
target_compile_definitions(dashboard PUBLIC "PROTOBUF_USE_DLLS")
target_link_libraries(dashboard PUBLIC 
    gRPC::grpc
    gRPC::grpc++
    gRPC::grpc++_reflection
    protobuf::libprotobuf
)

# set (CLIENT_SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/src_client"
#    CACHE PATH "Project Client SRC" FORCE)
# file(GLOB_RECURSE CLIENT_SRC CMAKE_CONFIGURE_DEPENDS "${CLIENT_SRC_PATH}/*.[ch]pp")
# add_executable (GRPC_Client "GRPC_Client.cpp" "GRPC_Client.h" ${PROTO_SRC} ${PROTO_HEADERS} ${CLIENT_SRC})

# target_include_directories(GRPC_Client PUBLIC "${PROTO_SRC_PATH}")
# target_compile_definitions(GRPC_Client PUBLIC PROTOBUF_USE_DLLS)
# target_link_libraries(GRPC_Client PUBLIC
#  gRPC::grpc++
#  protobuf::libprotobuf
# )