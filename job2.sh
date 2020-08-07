cd /root/TASKS/task6/ 
if ls *| grep .php
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


if ls * | grep .html
then
if kubectl get deployment | grep webserver
then
echo "web server is already running"
else
kubectl apply -f webserver.yml
fi
else
echo "No html file for deployment"
fi

POD=$(kubectl get pods -l app=webserver -o jsonpath="{.items[0].metadata.name}")
kubectl cp *.html $POD:/usr/local/apache2/htdocs/

 