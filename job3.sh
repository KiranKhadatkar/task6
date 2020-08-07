status=$(curl -o /dev/null -sw "%{http_code}" http://192.168.56.101:80/index.php)
if [[$status == 200]]
then
  exit 1
else
  exit 0
fi