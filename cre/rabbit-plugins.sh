#!/bin/bash

# create directory if not exists
if [ ! -f "/cre/plugins/v$RABBIT_DELAY_VERSION" ]; then
    echo "Plugin Directory v$RABBIT_DELAY_VERSION will be created."
    mkdir -p "/cre/plugins/v$RABBIT_DELAY_VERSION"
else
    echo "Plugin Directory v$RABBIT_DELAY_VERSION exists."
fi

# download file if not exists
if [ ! -f "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez" ]; then
    echo "Delayed Message Plugin v$RABBIT_DELAY_VERSION will be downloaded."
    wget "https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez" -O "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.tmp.ez"
    PLUGINSIZE=$(stat -c%s "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.tmp.ez")
    if [ $(echo " $PLUGINSIZE > 1000" | bc) -eq 1 ]; then
        mv "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.tmp.ez" "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez"
    else
        echo "Delayed Message Plugin v$RABBIT_DELAY_VERSION does not exist."         
        rm -f "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.tmp.ez"
    fi 
else
    echo "Delayed Message Plugin v$RABBIT_DELAY_VERSION exists."
fi




