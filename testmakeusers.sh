usergroup=$1
useridfront=$2
max=$3
usergroup=$1
useridfront=$2
max=$3
ptype=$4

grep $usergroup /etc/group
if [ $(echo $?) != "0" ];then
  groupadd $usergroup
fi

for i in `seq -w 1 $max`
do
  echo "Creating user :$useridfront$i"
  useradd -u $((8999+i)) -G $usergroup $useridfront$i -d /home/stu/$useridfront$i
  echo "$useridfront$i "|passwd --stdin $useridfront$i
  setquota -u $useridfront$i  102400 122880  0 0 /home/
done

