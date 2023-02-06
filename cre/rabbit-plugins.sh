#!/bin/bash

# create directory if not exists
if [ ! -f "/cre/plugins/v$RABBIT_DELAY_VERSION" ]; then
    mkdir -p "/cre/plugins/v$RABBIT_DELAY_VERSION"
fi

# download file if not exists
if [ ! -f "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez" ]; then
    wget "https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez" -O "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.tmp.ez"
    PLUGINSIZE=$(stat -c%s "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.tmp.ez")
    if [ (( $PLUGINSIZE > 1000)) ]; then
        mv "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.tmp.ez" "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez"
    else
        rm -f "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.tmp.ez"
    fi 
fi




