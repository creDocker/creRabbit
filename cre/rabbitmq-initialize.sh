#!/bin/bash

sleep 3 
echo "initialize rabbitmq server"
rabbitmqctl await_startup
sleep 1
echo "rabbitmq server running"

wget http://127.0.0.1:15672/cli/rabbitmqadmin
sleep 3
chmod +x rabbitmqadmin
mv rabbitmqadmin /etc/rabbitmq/rabbitmqadmin

#munchausen-swamp
/etc/rabbitmq/rabbitmqadmin declare exchange name="cre.swamp" type=direct  durable=false auto_delete=true
/etc/rabbitmq/rabbitmqadmin declare queue name="cre.munchausen" durable=false auto_delete=true
/etc/rabbitmq/rabbitmqadmin declare binding source="cre.swamp" destination="cre.munchausen" routing_key="cre.horse" 
## [destination_type=... arguments=...]

amqp-consume -e "cre.swamp" -q "cre.munchausen" -r "cre.horse" --vhost "/" -d ./create-queue.sh

