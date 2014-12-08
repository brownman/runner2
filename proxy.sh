#change user to root
#RUN ./fix/permission.sh
#make travis and docker passing step after step together
#RUN ./travis.sh
echo "---------------------"
echo "dir_start:     $PWD"
echo "---------------------"

install1(){
  sudo apt-get install -y toilet figlet 1>/dev/null
}

where_am_i(){
  echo $( cd `dirname  $PWD`;echo $PWD; )
}

set_env1(){
dir_self=$( where_am_i )
ln -s $dir_self/travis.sh /tmp
}

switch_user(){
sudo su -c 'whoami'
sudo su -c '/tmp/travis.sh'
}

steps(){
install1
set_env1
switch_user
}

steps
