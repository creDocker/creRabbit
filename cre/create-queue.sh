#!/bin/bash

read line
echo "Message: $line"

#initQueue='{"exchange":"cre.default", "binding":"cre.image.demo", "queue":"cre.image.show"}'

exchange=$(echo $line | jq -r '.exchange' )
binding=$(echo $line | jq -r '.binding' )
queue=$(echo $line | jq -r '.queue' )

delayed=$(/usr/sbin/rabbitmq-plugins list -E rabbitXmq_delayed_message_exchange | grep rabbitXmq_delayed_message_exchange)
echo $delayed 

#/etc/rabbitmq/rabbitmqadmin declare exchange name=$exchange type=direct durable=true auto_delete=false
/etc/rabbitmq/rabbitmqadmin declare exchange name=$exchange type=x-delayed-message arguments={"x-delayed-type":"direct"} durable=true auto_delete=false
/etc/rabbitmq/rabbitmqadmin declare queue name=$queue durable=true auto_delete=false
/etc/rabbitmq/rabbitmqadmin declare binding source=$exchange destination=$queue routing_key=$binding 
 

