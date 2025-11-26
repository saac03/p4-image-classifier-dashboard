#include <iostream>
#include <memory>
#include <string>

#include <grpcpp/grpcpp.h>
#include "proto/cpp/hello.grpc.pb.h"

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;
using hello::HelloGRPC;
using hello::HelloRequest;
using hello::HelloReply;

class HelloService final : public HelloGRPC::Service {
    Status SayHello(ServerContext* context, const HelloRequest* request, HelloReply* reply) override {
        std::cout << "SayHello called with name: " << request->name() << std::endl;
        reply->set_status(true);
        reply->set_msg("Hello " + request->name() + " from C++ Server!");
        return Status::OK;
    }
};

void RunServer() {
    std::string server_address("0.0.0.0:50051");
    HelloService service;

    ServerBuilder builder;
    builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
    builder.RegisterService(&service);

    std::unique_ptr<Server> server(builder.BuildAndStart());
    std::cout << "C++ server running on " << server_address << std::endl;
    server->Wait();
}

int main() {
    RunServer();
    return 0;
}
