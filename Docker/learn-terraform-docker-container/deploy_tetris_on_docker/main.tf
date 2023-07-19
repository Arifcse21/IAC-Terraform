terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "3.0.2"
        }
    }
}

provider "docker" {
    host = "unix:///var/run/docker.sock"    # optional if docker daemon is already running
}

# Pulls the image 
resource "docker_image" "uzyexe/tetris" {
    name = "uzyexe/tetris:latest"
    keep_locally = false
}

# Create the container
resource "docker_container" "tetris" {
    image = docker_image.name.image_id
    name = "tetris"
}