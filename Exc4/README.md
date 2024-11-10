# Exc 4

|  Группа |  Роль |                                  Полномочия                                 |
|:-------:|:-----:|:---------------------------------------------------------------------------:|
| Viewers | view  | Просмотр ресурсов кластера (Pods, Deployments, ConfigMaps и т.д.)           |
| Editors | edit  | Полный доступ к изменениям в кластере, но без управления ролями и секретами |
| Admins  | admin | Полный доступ к кластеру, включая управление ролями и просмотр секретов     |

## Создание пользователей
```bash
./create_users.sh
```

## Создание ролей
```bash
kubectl apply -f view-role.yml
kubectl apply -f edit-role.yml
kubectl apply -f admin-role.yml
```

## Биндинг ролей к пользователям
```bash
./bind_users_to_roles.sh
```