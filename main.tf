provider "google" {
  project = "rock-palisade-275417"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}




variable "image_type" {
  type = string
}

variable "flavor" {
  type = string
}

variable "vm_name" {
  type = string
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.flavor

  boot_disk {
    initialize_params {
      image = var.image_type
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}
