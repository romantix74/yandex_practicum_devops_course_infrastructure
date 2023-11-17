variable "instance_name" {
  type        = string
  description = "instance name"
  nullable = false
} 

variable "instance_platform_id" {
  type        = string
  default = "standard-v1"
  description = "platform id"
} 


variable "instance_zone" {
  default     = "ru-central1-a"
  type        = string
  description = "Instance availability zone"
  validation {
    condition     = contains(toset(["ru-central1-a", "ru-central1-b", "ru-central1-c"]), var.instance_zone)
    error_message = "Select availability zone from the list: ru-central1-a, ru-central1-b, ru-central1-c."
  }
  sensitive = true
  nullable = false
} 

variable "instance_cpu_cores" {
  default = 2
  type        = number
  description = "instance cores"
} 

variable "instance_memory" {
  default = 2
  type        = number
  description = "instance emory in GB"
} 

variable "instance_image_id" {
  default = "e9bmq2f27li3v3u21i30"
  type        = string
  description = "instance image id"
} 

variable "instance_disk_size" {
  default = "50"
  type        = string
  description = "instance disk size in GB"
} 