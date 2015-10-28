useridfront=$1
max=$2

for i in `seq 10 $max`
do
  #echo "$useridfront$i" |passwd --stdin $useridfront$i
  #echo "$useridfront$i:$useridfront$i" | chpasswd
  echo "$useridfront$i:$useridfront$i" | chpasswd -m
done

