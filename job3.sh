IP="http://$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' task6os):81/index.php"

echo $IP

if curl -s -o /dev/null -w '%{http_code}\n' $IP | grep 200

then
        echo Website is Responding Properly
        exit 0
else
        echo Website is not Responding Properly
        exit 1
fi