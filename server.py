import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'proto', 'py'))

import grpc
from proto.py import hello_pb2, hello_pb2_grpc

channel = grpc.insecure_channel("localhost:50051")
stub = hello_pb2_grpc.HelloGRPCStub(channel)
response = stub.SayHello(hello_pb2.HelloRequest(name="Isaac"))
print("Status:", response.status)
print("Message:", response.msg)