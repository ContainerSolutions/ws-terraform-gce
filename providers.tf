provider "google" {
  credentials = "${file("credentials/google.json")}"
  project     = "capgeminiws"
  region      = "${var.region}"
}
