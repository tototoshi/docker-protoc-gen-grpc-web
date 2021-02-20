#!/bin/bash

set -eux

src_dir=.
out_dir=out

mkdir -p $out_dir

docker build -t protoc .
docker run -it --rm \
    -v $(pwd):/protoc \
    protoc \
    -I=$src_dir \
    --js_out=import_style=commonjs,binary:$out_dir \
    --grpc-web_out=import_style=typescript,mode=grpcweb:$out_dir \
    test.proto

test -f $out_dir/test_pb.d.ts
test -f $out_dir/test_pb.js
test -f $out_dir/TestServiceClientPb.ts
