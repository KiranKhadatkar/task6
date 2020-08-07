status=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.43.174)
if [[$status == 200]]
then
  exit 1
else
  exit 0
fi