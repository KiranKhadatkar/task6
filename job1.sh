if find /host/TASKS -name task6
then
echo "Folder already exists"
else
mkdir -p /host/TASKS/task6
fi

cp -rvf * /host/TASKS/task6