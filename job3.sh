status=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.56.101)
if [[$status == 200]]
then
  exit 1
else
  exit 0
fi