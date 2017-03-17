resource "google_compute_firewall" "web" {
  name    = "${var.environment}-web"
  network = "${google_compute_network.web.name}"

  // Allow ping
  allow {
    protocol = "icmp"
  }

  // Allow incoming SSH connections
  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  // Allow incoming connections to typespeed
  allow {
    protocol = "tcp"
    ports = ["6025"]
  }

  // Allow incoming HTTP & HTTPS traffic
  allow {
    protocol = "tcp"
    ports = ["80", "443"]
  }
}
