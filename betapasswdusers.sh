for i in `seq 3 7`
do
  echo "cbb10400$i" |passwd "cbb10400$i" --stdin
  #echo "cbb10400$i:cbb10400$i" | chpasswd -m
done

