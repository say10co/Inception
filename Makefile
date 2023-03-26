env_file_path= ./srcs/.env 
make_dir_path= ./srcs/requirements/tools/make_dir.sh 
yaml_file_path= ./srcs/docker-compose.yml 

mariadb=mariadb
nginx=nginx-container
wordpress=wordpress

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m


network_name=inception-network
volumes = nginx-wp-volume mariadb-volume

all: create_data 
	@printf "$(COLOUR_GREEN) Lunching Containers ...\n $(COLOUR_END)"
	docker-compose --file $(yaml_file_path) --env-file  $(env_file_path) up --detach

build: create_data
	@printf "$(COLOUR_GREEN) Buillding images from $(yaml_file_path) ... $(COLOUR_END)\n"
	docker-compose --file $(yaml_file_path) --env-file $(env_file_path) --build

create_data:
	@printf "$(COLOUR_GREEN) Creating ~/data folders ...\n $(COLOUR_END)"
	sh $(make_dir_path) '--CREATE'

down:
	@printf "$(COLOUR_GREEN) Stopping Containers ...\n $(COLOUR_END)"
	docker-compose --file $(yaml_file_path) down

clean: down
	docker network rm $(network_name)
	docker volume rm $(volumes)
	sh $(make_dir_path) --DELETE

fclean:
	@printf "$(COLOUR_RED )Removimg all unused images no confirmation needed! $(COLOUR_END)"
	docker system prune --all --volumes --force
	docker network prune --force
	docker volume prune --force
logs:
	@printf "$(COLOUR_BLUE) ***mariadb*** Container logs ...\n $(COLOUR_END)"
	docker logs --timestamps $(mariadb)
	@printf "$(COLOUR_BLUE) ***wordpress*** Container logs ...\n $(COLOUR_END)"
	docker logs --timestamps $(wordpress)
	@printf "$(COLOUR_BLUE) ***nginx*** Container logs ...\n $(COLOUR_END)"
	docker logs --timestamps $(nginx)

re: down build

.PHONY	: all build down re clean fclean create_data

