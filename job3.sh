export status=$(curl -siw "%{http_code}" -o /dev/null http://192.168.99.101:31766)
if [$status == 200]
then
echo "done"
exit 1
else
exit 0
fi