resource "google_compute_instance" "web" {
  count        = 3
  name         = "${var.environment}-${format("web-%03d", count.index + 1)}"
  machine_type = "${var.default_machine_type}"
  zone         = "${var.zone}"

  tags = ["web"]

  disk {
    image = "debian-cloud/debian-8"
  }

  network_interface {
    network = "${google_compute_network.web.name}"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    role = "web"
  }

  metadata_startup_script = "apt-get update && apt-get upgrade -y && apt-get install -y vim tmux typespeed docker.io && docker run -d -p 80:8000 -e VERSION=1.0 mongrelion/gapp"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

output "public_ip" {
  value = "${google_compute_instance.web.0.network_interface.0.access_config.0.assigned_nat_ip}"
}
