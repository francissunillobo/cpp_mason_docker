#!/bin/bash

# Build and run C++ application with Docker

echo "Building Docker image..."
docker build -t cpp-mason-app .

echo "Running C++ application..."
docker run --rm cpp-mason-app

echo "Done!"
