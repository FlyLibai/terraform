terraform {
  required_providers {
    docker  = {
    source = "kreuzwerker/docker" 
    version = "2.16.0"
    } 
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

 resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = true
}

 resource "docker_container" "nginx"{
 image = docker_image.nginx.name
 name = "nginx"
 ports {
  internal = 80
  external = 8000
 }
 volumes{
 container_path = "/home/admin/data/nginx_home"
 host_path = "/home/admin/data/nginx_home"
 }
}
