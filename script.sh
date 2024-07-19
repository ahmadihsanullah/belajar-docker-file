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