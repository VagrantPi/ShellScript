usergroup=$1
useridfront=$2
max=$3

for i in `seq -w 1 $max`
do
  userdel $useridfront$i
  rm -rf /home/stu/$useridfront$i
done

groupdel $usergroup

