# Use Ubuntu as base image
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    python3 \
    python3-pip \
    ninja-build \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Meson
RUN pip3 install meson

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the project
RUN meson setup builddir
RUN meson compile -C builddir

# Set the default command to run the executable
CMD ["./builddir/src/main"]
