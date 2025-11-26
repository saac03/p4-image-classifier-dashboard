set VCPKG_ROOT=D:\school\vcpkg
set protobuf_cmd=%VCPKG_ROOT%\packages\protobuf_x64-windows\tools\protobuf\protoc.exe

set src=C:\Users\Isaac\Desktop\P4\p4-image-classifier-dashboard\proto\py
set proto_file=%src%\dashboard.proto
set dest=%src%

python -m grpc_tools.protoc ^
  --proto_path="%src%" ^
  --python_out="%src%" ^
  --grpc_python_out="%src%" ^
  "%proto_file%"