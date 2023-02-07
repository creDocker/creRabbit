#!/bin/bash

echo "Current dir: $(pwd)"
echo "Current env: $(env)"
currentRoot="/"
if [ ! -z $GITHUB_REPOSITORY ]; then
    currentRoot="$(pwd)"
fi

echo "checking for $currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION"

# create directory if not exists
if [ ! -f "$currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION" ]; then
    echo "Plugin Directory v$RABBIT_DELAY_VERSION will be created."
    mkdir -p "$currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION"
else
    echo "Plugin Directory v$RABBIT_DELAY_VERSION exists."
fi

# download file if not exists
if [ ! -f "$currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez" ]; then
    echo "Delayed Message Plugin v$RABBIT_DELAY_VERSION will be downloaded."
    wget "https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez" -O "$currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.ez.tmp"
    PLUGINSIZE=$(stat -c%s "$currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.ez.tmp")
    if [ $(echo " $PLUGINSIZE > 1000" | bc) -eq 1 ]; then
        echo "Delayed Message Plugin v$RABBIT_DELAY_VERSION downloaded successfully."
        mv "$currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.ez.tmp" "$currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange-$RABBIT_DELAY_VERSION.ez"
        echo "$(ls -l $currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION)" 
    else
        echo "Delayed Message Plugin v$RABBIT_DELAY_VERSION does not exist."         
        rm -f "$currentRoot/cre/plugins/v$RABBIT_DELAY_VERSION/rabbitmq_delayed_message_exchange.ez.tmp"
    fi 
else
    echo "Delayed Message Plugin v$RABBIT_DELAY_VERSION exists."
fi




