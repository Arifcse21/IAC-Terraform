terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock" # optional if docker daemon is already running
}

# Create the container
resource "docker_container" "tetris" {
  image = "uzyexe/tetris"	# data.docker_image.tetris.name # access docker image name from data.tf
  name  = var.docker_container
}
