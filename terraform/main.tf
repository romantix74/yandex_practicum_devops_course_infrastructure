module "std-022-024_compute_instance" {
  source = "./modules/tf-yc-instance"
  instance_name = "chapter5-lesson2-std-022-024"
  instance_platform_id = "standard-v1"
  instance_zone = "ru-central1-a"
  instance_cpu_cores = 2
  instance_memory = 2
  instance_image_id = "fd85f37uh98ldl1omk30"
  instance_subnet_id = module.yandex_vpc.yandex_vpc_subnets["ru-central1-a"].subnet_id
} 

output "std-022-024_compute_instance_ip" {
  value = module.std-022-024_compute_instance.ip_address_external
}


module "yandex_vpc" {
  source = "./modules/tf-yc-network"
}