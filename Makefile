.PHONY: build clean deploy

build:
	docker build --no-cache -t gcr.io/instana-solution-architects/python-app:v2 python-app
	docker push gcr.io/instana-solution-architects/python-app:v2

deploy:
	kubectl apply -f k8s/deployment.yaml
	kubectl apply -f k8s/service.yaml

clean:
	kubectl delete -f k8s/deployment.yaml
	kubectl delete -f k8s/service.yaml


