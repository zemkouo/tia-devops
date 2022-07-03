#! /bin/bash
for i in $(ls /home)
do
 echo "Welcome to Devops Easy Learning we are here to help" > /home/$i/file1
 echo "Welcome to Devops Easy Learning we are here to help" > /home/$i/file2
 echo "Welcome to Devops Easy Learning we are here to help" > /home/$i/file3
 echo "Welcome to Devops Easy Learning we are here to help" > /home/$i/file4
 echo "Welcome to Devops Easy Learning we are here to help" > /home/$i/file5
 rm -rf   /home/$i/labs
 cp -r script.sh  /home/$i
 cp -r /root/more /home/$i/more
 mkdir -p /home/$i/change1/change2/change3/change_last
 mkdir /home/$i/directory1
 mkdir /home/$i/directory2
 mkdir /home/$i/directory3
 mkdir /home/$i/directory4
 mkdir /home/$i/directory5
done