#!/bin/bash

read line
echo "Message: $line"

#initQueue='{"exchange":"cre.default", "binding":"cre.image.demo", "queue":"cre.image.show"}'

exchange=$(echo $line | jq -r '.exchange' )
binding=$(echo $line | jq -r '.binding' )
queue=$(echo $line | jq -r '.queue' )

# when delayed plugin installed, then use it.
delayed=$(/usr/sbin/rabbitmq-plugins list -E rabbitmq_delayed_message_exchange | grep rabbitmq_delayed_message_exchange | grep -cP "[E*]")
if [ $delayed -eq 0 ]; then
    /etc/rabbitmq/rabbitmqadmin declare exchange name=$exchange type=direct durable=true auto_delete=false
else
    /etc/rabbitmq/rabbitmqadmin declare exchange name=$exchange type=x-delayed-message arguments="{'x-delayed-type':'direct'}" durable=true auto_delete=false 
fi

/etc/rabbitmq/rabbitmqadmin declare queue name=$queue durable=true auto_delete=false
/etc/rabbitmq/rabbitmqadmin declare binding source=$exchange destination=$queue routing_key=$binding 
 

