variable "default_machine_type" {
  default = "f1-micro"
}

variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "europe-west1-c"
}

variable "environment" {
  description = "the environment that you are targetting"
}
