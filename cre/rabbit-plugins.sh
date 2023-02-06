#!/bin/bash

# create directory if not exists
if [ ! -f "/cre/plugins/v$RABBIT_DELAY_VERSION" ]; then
    mkdir -p "/cre/plugins/v$RABBIT_DELAY_VERSION"
fi

# download file if not exists
if [ ! -f "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez" ]; then
    wget "https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez" -O "/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez"
fi




