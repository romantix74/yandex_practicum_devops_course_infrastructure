resource "yandex_compute_instance" "vm-1" {
    name = var.instance_name
    platform_id = var.instance_platform_id
    zone = var.instance_zone

    scheduling_policy {
        preemptible = false
    }
    # Конфигурация ресурсов:
    # количество процессоров и оперативной памяти
    resources {
        cores  = var.instance_cpu_cores
        memory = var.instance_memory
    }

    # Загрузочный диск:
    # здесь указывается образ операционной системы
    # для новой виртуальной машины
    boot_disk {
        initialize_params {
            image_id = var.instance_image_id
            size = var.instance_disk_size

        }
    }

    # Сетевой интерфейс:
    # нужно указать идентификатор подсети, к которой будет подключена ВМ
    network_interface {
        subnet_id = "e9bmq2f27li3v3u21i30"
        nat       = true
    }

    # Метаданные машины:
    # здесь можно указать скрипт, который запустится при создании ВМ
    # или список SSH-ключей для доступа на ВМ
    metadata = {
        #ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
        user-data = file("${path.module}/meta.txt")
    }
    
}
