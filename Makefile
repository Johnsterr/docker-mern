mongo:
	docker run -p 27017:27017 \
		-d \
		--rm \
		--name mongodb \
		--network notes-net \
		--env-file ./config/development.env \
		-v mongo-data:/data/db \
		mongo

backend:
	docker run -p 5000:5000 \
		-d \
	    --rm \
	    --name notes-backend \
	    --network notes-net \
	    -v ${PWD}/server:/app \
	    -v /app/node_modules \
	    --env-file ./config/development.env \
	    notes-backend

frontend:
	docker run -p 3000:3000 \
		-d \
	    --rm \
	    --name notes-frontend \
	    -e CHOKIDAR_USEPOLLING=true \
	    -v ${PWD}/client/src:/app/src \
	    notes-frontend

stop:
	docker stop mongodb notes-frontend notes-backend

dev:
	docker-compose -f docker-compose.yml up -d