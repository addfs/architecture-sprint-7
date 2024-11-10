# Exc 5

```bash
make run
```

Проверка что бэк доступен с фронта
```bash
make connectivity-test-frontend
```

```bash
make connectivity-test-frontend-admin
```

Проверка доступа из внешнего сервиса

```bash
kubectl run test-$RANDOM -it --rm --image=alpine --image-pull-policy=Never -- sh \
  -c "wget -qO- --timeout=2 http://front-end-app"
```

```bash
kubectl run test-$RANDOM -it --rm --image=alpine --image-pull-policy=Never -- sh \
  -c "wget -qO- --timeout=2 http://admin-front-end-app"
```

```bash
kubectl run test-$RANDOM -it --rm --image=alpine --image-pull-policy=Never -- sh \
  -c "wget -qO- --timeout=2 http://back-end-api"
```

```bash
kubectl run test-$RANDOM -it --rm --image=alpine --image-pull-policy=Never -- sh \
  -c "wget -qO- --timeout=2 http://admin-back-end-api"
```

