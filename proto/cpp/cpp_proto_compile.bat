set VCPKG_ROOT=D:\school\vcpkg
set protobuf_cmd=%VCPKG_ROOT%\packages\protobuf_x64-windows\tools\protobuf\protoc.exe
set grpc_exe=%VCPKG_ROOT%\installed\x64-windows\tools\grpc\grpc_cpp_plugin.exe

set src=C:\Users\Isaac\Desktop\P4\p4-image-classifier-dashboard\proto\cpp
set proto_file=%src%\hello.proto
set dest=%src%

"%protobuf_cmd%" --proto_path="%src%" --cpp_out="%dest%" --grpc_out="%dest%" --plugin=protoc-gen-grpc="%grpc_exe%" "%proto_file%" 
