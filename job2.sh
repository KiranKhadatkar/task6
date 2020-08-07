if file cd /TASKS/task6/* | grep php
then
if sudo kubectl get deployment | grep phpserver
then
echo "php server is already running"
else
sudo kubectl apply -f phpserver.yml
fi
fi

POD=$(kubectl get pods -l app=phpserver -o jsonpath="{.items[0].metadata.name}")
sudo kubectl cp *.php $POD:/var/www/html


if file cd TASKS/task6/* | grep html
then
if sudo kubectl get deployment | grep webserver
then
echo "web server is already running"
else
sudo kubectl apply -f webserver.yml
fi
fi

POD=$(kubectl get pods -l app=webserver -o jsonpath="{.items[0].metadata.name}")
sudo kubectl cp *.html $POD:/usr/local/apache2/htdocs/

 