resource "google_compute_network" "web" {
  name                    = "${var.environment}-web"
  auto_create_subnetworks = true
}
