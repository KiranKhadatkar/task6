if file cd TASKS/task6/* | grep .php
then
if kubectl get deployment | grep phpserver
then
echo "php server is already running"
else
kubectl apply -f phpserver.yml
fi
fi

POD=$(kubectl get pods -l app=phpserver -o jsonpath="{.items[0].metadata.name}")
kubectl cp *.php $POD:/var/www/html


if file cd TASKS/task6/* | grep .html
then
if kubectl get deployment | grep webserver
then
echo "web server is already running"
else
kubectl apply -f webserver.yml
fi
fi

POD=$(kubectl get pods -l app=webserver -o jsonpath="{.items[0].metadata.name}")
kubectl cp *.html $POD:/usr/local/apache2/htdocs/

 