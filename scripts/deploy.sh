#!/bin/bash

kubectl create secret generic aws-secret --from-literal=credentials=${AWS_BUCKET_CREDENTIALS}
kubectl create secret generic env-secret --from-literal=POSTGRESS_USERNAME=${POSTGRESS_USERNAME} --from-literal=POSTGRESS_PASSWORD=${POSTGRESS_PASSWORD}

kubectl apply .f udacity-c3-deployment/k8s

kubectl set image deployments/backend-feed backend-feed=hupe1980/udacity-restapi-feed:$SHA
kubectl set image deployments/backend-user backend-user=hupe1980/udacity-restapi-user:$SHA
kubectl set image deployments/frontend frontend=hupe1980/udacity-frontend:$SHA
kubectl set image deployments/reverseproxy reverseproxy=hupe1980/udacity-reverseproxy:$SHA