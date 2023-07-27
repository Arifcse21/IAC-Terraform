terraform {
    required_provider {
        docker = {
            source  = "kreuzwerker/docker"
            version = "3.0.2"
        }
    }
}

provider "docker" {
    host = "unix:///var/run/docker.sock"
}

# Create the container

