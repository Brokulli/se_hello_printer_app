SERVICE_NAME=hello-world-printer
MY_DOCKER_NAME=$(SERVICE_NAME)

.PHONY: test
.DEFAULT_GOAL :=test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test
	PYTHONPATH=. py.test  --verbose -s --cov=.
	PYTHONPATH=. py.test  --cov=. --junit-xml=test_results.xml
		-test_cov
		-test_xunit

run:
	python main.py

docker_build:
	docker build -t $(MY_DOCKER_NAME) .

docker_run: docker_build
	docker run \
		--name $(MY_DOCKER_NAME)-dev \
		-p 5000:5000 \
		-d $(MY_DOCKER_NAME)

docker_stop:
	docker_stop $(MY_DOCKER_NAME)-dev

USERNAME=brokulli
TAG=$(USERNAME)/$(MY_DOCKER_NAME)

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(MY_DOCKER_NAME) $(TAG); \
	docker push $(TAG); \
	docker logout;
