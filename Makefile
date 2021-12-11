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
	    --env-file ./config/development.env \
	    notes-backend

frontend:
	docker run -p 3000:3000 \
		-d \
	    --rm \
	    --name notes-frontend \
	    notes-frontend