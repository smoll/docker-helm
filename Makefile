default: build spike push

build:
	docker build -t smoll/helm .

push:
	docker push smoll/helm

spike:
	docker run --rm smoll/helm helm -h
