Role Name
=========


Настройка ифслутв
Для запуска прописываем переменные , либо используем дефолтные.

 JAR Артефакт скачивается c NEXUS,  поэтому используем пароль, который шщифруется с помощью файла .vault. :
 ```
 ansible-vault encrypt_string "{ password for nexus }" --name backend_maven_password
 ```

 Далее прописываем полученный зашифрованный пароль в group_vars, либо в host_vars.