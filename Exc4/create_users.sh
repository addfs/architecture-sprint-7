#!/bin/bash

#!/bin/bash

# Создаем пользователей как ServiceAccounts
kubectl create serviceaccount user -n default
kubectl create serviceaccount developer -n default
kubectl create serviceaccount admin -n default


kubectl create token user -n default
kubectl create token developer -n default
kubectl create token admin -n default
