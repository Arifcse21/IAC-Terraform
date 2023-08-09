terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


# data.tf
data "docker_image" "elasticsearch" {
  name = "docker.elastic.co/elasticsearch/elasticsearch:7.14.0"
}

# Create the container
resource "docker_container" "elasticsearch" {
  name  = "elasticsearch"
  image = data.docker_image.elasticsearch

  ports {
    internal = 9200
    external = 9200
  }

  restart = "unless-stopped"
}
