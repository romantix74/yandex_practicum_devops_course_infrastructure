variable "network_zones" {
  type        = set(string)
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
  description = "network zones"
}
