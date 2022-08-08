# docker 

docker_enter() {
    docker exec -it $1 bash;
}

docker_enter_bash() {
    docker exec -it $1 bash;
}

docker_enter_sh() {
    docker exec -it $1 sh;
}