# From Instruction
docker build -t ahmad/from from

docker image ls

# Run Instruction => hanya berjalan di image 
docker build -t ahmad/run run

docker build -t ahmad/run run --progress=plain --no-cache

# CMD Instruction => berjalan di container 
docker build -t ahmad/command command

docker image inspect ahmad/command

docker container create --name command ahmad/command

docker container start command

docker container logs command

# LABEL Instruction
docker build -t ahmad/label label

docker image inspect ahmad/label

# ADD Instruction
docker build -t ahmad/add add

docker container create --name add ahmad/add

docker container start add

docker container logs add

# COPY Instruction
docker build -t ahmad/copy copy

docker container create --name copy ahmad/copy

docker container start copy

docker container logs copy

# .dockerignore
docker build -t ahmad/ignore ignore

docker container create --name ignore ahmad/ignore

docker container start ignore

docker container logs ignore

# EXPOSE Instruction
docker build -t ahmad/expose expose

docker image inspect ahmad/expose

docker container create --name expose -p 8080:8080 ahmad/expose

docker container start expose

docker container ls

docker container stop expose


# ENV Instruction
docker build -t ahmad/env env

docker image inspect ahmad/env

docker container create --name env --env APP_PORT=9090 -p 9090:9090 ahmad/env

docker container start env

docker container ls

docker container logs env

docker container stop env

# VOLUME Instruction
docker build -t ahmad/volume volume

docker image inspect ahmad/volume

docker container create --name volume -p 8080:8080 ahmad/volume

docker container start volume

docker container logs volume

docker container inspect volume

#5b240aca40754b4cf111d32e878ecfeb560097b35c7991b2158183f0f951df12

docker volume ls

# mencoba membackup volume
docker run --rm -v 5b240aca40754b4cf111d32e878ecfeb560097b35c7991b2158183f0f951df12:/logs -v $(pwd):/backup busybox tar czvf /backup/backup.tar.gz /logs

# Membuat volume baru
docker volume create new_volume

# Merestore data dari file tar ke volume baru
docker run --rm -v new_volume:/logs -v $(pwd):/backup busybox tar xzvf /backup/backup.tar.gz -C /logs

docker run -d --name my_go_app_new -p 8080:8080 -v new_volume:/logs ahmad/volume
docker container start my_go_app_new
docker container exec -it my_go_app_new sh

# WORKDIR Instruction
docker build -t ahmad/workdir workdir

docker container create --name workdir -p 8080:8080 ahmad/workdir

docker container start workdir

docker container exec -i -t workdir /bin/sh