usergroup=$1
useridfront=$2
max=$3
ptype=$4

grep $usergroup /etc/group
if [ $(echo $?) != "0" ];then
  groupadd $usergroup
fi

for i in `seq 1 $max`
do
  echo "Creating user :$useridfront$(($i+9))"
  ###useradd -G $usergroup $useridfront$i -d "/home/$usergroup/"
  ###echo "$useridfront$i"|passwd --stdin $useridfront$i
  #if [ $ptype == "graduate" ];then
  #  useradd -G $usergroup $useridfront$i -d /home/gra/
  #  echo "$useridfront$i"|passwd --stdin $useridfront$i
  #  xfs_quota -xc "limit bsoft=190m bhard=200m $limitm $useridfront$i" /home
  #else
    #useradd -u $((8999+i)) -G $usergroup $useridfront$i -d /home/stu/$useridfront$i
    useradd -u $((9008+i)) -G $usergroup $useridfront$(($i+9)) -d /home/stu/$useridfront$(($i+9))
    echo "$useridfront$(($i+9)) "|passwd --stdin $useridfront$(($i+9))
    #xfs_quota -xc "limit bsoft=90m bhard=100m $limitm $useridfront$i" /home
    setquota -u $useridfront$(($i+9))  102400 122880  0 0 /home/
  #fi
done

