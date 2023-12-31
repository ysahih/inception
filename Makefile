YAML=srcs/docker-compose.yml

all:
	sudo docker compose -f $(YAML) up --build -d

stop:
	sudo docker compose -f $(YAML) down -v

clean:
	sudo docker stop $$(sudo docker ps -qa); sudo docker rm $$(sudo docker ps -qa); sudo docker rmi -f $$(sudo docker images -qa); sudo docker volume rm $$(sudo docker volume ls -q); sudo docker network rm $$(sudo docker network ls -q) 2>/dev/null || true

fclean : clean
	 sudo docker system prune -af --all --volumes
