SHELL=/bin/bash -euo pipefail

FRONTEND_POD=$(shell kubectl get pods -l role=front-end -o jsonpath='{.items[0].metadata.name}')
FRONTEND_POD_ADMIN=$(shell kubectl get pods -l role=admin-front-end -o jsonpath='{.items[0].metadata.name}')

create-cluster:
	@kind create cluster

delete-cluster:
	@kind delete cluster

use-cluster:
	@kubectl config use-context kind-kind

pull-containers:
	@docker pull nginx
	@docker pull alpine
	@kind load docker-image nginx
	@kind load docker-image alpine

apply-nginx:
	@kubectl run front-end-app --image=nginx --image-pull-policy=Never --labels=role=front-end --expose --port=80
	@kubectl run back-end-api-app --image=nginx --image-pull-policy=Never --labels=role=back-end-api --expose --port=80
	@kubectl run admin-front-end-app --image=nginx --image-pull-policy=Never --labels=role=admin-front-end --expose --port=80
	@kubectl run admin-back-end-api-app --image=nginx --image-pull-policy=Never --labels=role=admin-back-end-api --expose --port=80

apply-network-policy:
	@kubectl apply -f default-np.yml
	@kubectl apply -f admin-api-allow.yml
	@kubectl apply -f non-admin-api-allow.yml


run: create-cluster use-cluster pull-containers apply-nginx apply-network-policy
	@echo "Cluster is ready"

connectivity-test-frontend:
	@echo "Frontend pod: ${FRONTEND_POD}"
	@kubectl exec -it ${FRONTEND_POD} -- curl -sS "http://back-end-api-app"

connectivity-test-frontend-admin:
	@echo "Frontend pod: ${FRONTEND_POD_ADMIN}"
	@kubectl exec -it ${FRONTEND_POD_ADMIN} -- curl -sS "http://admin-back-end-api-app"

