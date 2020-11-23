minikube delete --all

# systemctl restart docker

# minikube ip
minikube start --driver=docker

minikube addons enable metallb
minikube addons enable metrics-server
minikube addons disable ingress

kubectl apply -f ./srcs/configfiles/config.yaml

eval $(minikube docker-env)

cd ./srcs/ && sh docker_builder.sh

kubectl apply -f ./configfiles/service-config.yaml
kubectl apply -f ./configfiles/volume-config.yaml
kubectl apply -f ./configfiles/deployment.yaml
