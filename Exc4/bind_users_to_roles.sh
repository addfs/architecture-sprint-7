#!/bin/bash

kubectl create clusterrolebinding user-view \
  --clusterrole=view \
  --serviceaccount=default:user

kubectl create clusterrolebinding developer-edit \
  --clusterrole=edit \
  --serviceaccount=default:developer


kubectl create clusterrolebinding admin-admin \
  --clusterrole=admin \
  --serviceaccount=default:admin