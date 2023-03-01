#!/bin/bash

epinio login -u admin https://epinio.172.28.0.3.omg.howdoi.website -p password --trust-ca

epinio apps create gateway
epinio apps create orders
epinio apps create products

# Install using catalog
epinio service create postgresql-dev postgres
epinio service create redis-dev redis
epinio service create rabbitmq-dev rabbitmq


# Install using helm
# helm repo add bitnami https://charts.bitnami.com/bitnami

# helm upgrade rabbitmq bitnami/rabbitmq --install \
#   --set auth.username=guest,auth.password=rabbit

# helm upgrade postgresql bitnami/postgresql --install \
#   --set auth.username=postgres,auth.postgresPassword=postgres,auth.database=orders,auth.enablePostgresUser=true

# helm upgrade redis bitnami/redis --install \
#   --set global.redis.password=redis

epinio service bind postgres gateway
epinio service bind postgres orders
epinio service bind postgres products
epinio service bind redis gateway
epinio service bind redis orders
epinio service bind redis products
epinio service bind rabbitmq gateway
epinio service bind rabbitmq orders
epinio service bind rabbitmq products


epinio service bind postgres sample
epinio service bind redis sample
epinio service bind rabbitmq sample