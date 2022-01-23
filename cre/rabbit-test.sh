sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

cat /cre/versions.txt

if [ ! -f /cre/rabbitmq-procfile ]; then
    echo "[FAIL]: File /cre/rabbitmq-procfile not found!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "rabbitMq")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: rabbit not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "rabbitMq \t $RABBITMQ_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of rabbit installed!"
    #exit 1
fi

shoreman /cre/rabbitmq-procfile &

sleep 2

# No test in the moment

echo "[SUCCESS]"
exit 0
