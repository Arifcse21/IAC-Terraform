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
  image = "uzyexe/tetris"
  name  = var.docker_container
  ports {
    internal = 8070
    external = 8070
  }
}
