if find /root/TASKS -name task6
then
echo "Folder already exists"
else
mkdir -p /root/TASKS/task6
fi

cp -rvf * /host/TASKS/task6