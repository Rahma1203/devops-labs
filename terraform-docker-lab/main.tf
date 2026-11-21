

terraform {
  required_version = ">=1.5.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

#Nginx image

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

#Web container

resource "docker_container" "web" {

  name  = "devops-terraform-web"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8081
    ip       = "127.0.0.1"
  }
}

# Access url 

output "web_url" {
  value = "http://127.0.0.1:8081"
}
