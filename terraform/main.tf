terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }
}

provider "yandex" {
  #token = "ajeo76etaclov4mc2sfr"
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gm68de4u794bg8egku"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
    name = "chapter5-lesson2-std-022-024"

    # Конфигурация ресурсов:
    # количество процессоров и оперативной памяти
    resources {
        cores  = 2
        memory = 2
    }

    # Загрузочный диск:
    # здесь указывается образ операционной системы
    # для новой виртуальной машины
    boot_disk {
        initialize_params {
            image_id = "fd826honb8s0i1jtt6cg"
        }
    }

    # Сетевой интерфейс:
    # нужно указать идентификатор подсети, к которой будет подключена ВМ
    network_interface {
        subnet_id = "e9bmq2f27li3v3u21i30"
        # nat       = false
    }

    # Метаданные машины:
    # здесь можно указать скрипт, который запустится при создании ВМ
    # или список SSH-ключей для доступа на ВМ
    metadata = {
        ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    
}

output "ip_address" {
        value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
    } 
