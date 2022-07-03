#!/bin/bash

username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

function user_add() {
    for users in $username
    do
        ls /home |grep $users &>/dev/nul || mkdir -p /home/$users 
        cat /etc/passwd |awk -F: '{print$1}' |grep -w $users &>/dev/nul ||  useradd $users
        chown -R $users:$users /home/$users
        usermod -s /bin/bash -aG docker $users
        echo -e "$users\n$users" |passwd "$users"
        # passwd --expire $users
    done
}


password_expire() {
    for users in $username
    do
        passwd --expire $users
    done
}

user_del() {
    for users in $username
    do
        userdel -r -f $users
    done
}

user_lock() {
    for users in $username
    do
        usermod -s /sbin/nologin $users
        cat /etc/passwd |grep $users
    done
}

user_unlock() {
    for users in $username
    do
        usermod -s /bin/bash $users
        cat /etc/passwd |grep $users
    done
}

docker_run() {
    docker rm -f $USER || true
    docker run -d --name $USER --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /var/run/docker.sock:/var/run/docker.sock -v "${HOME}":/student_home -w "/student_home" ${IMAGE_TAG}
    docker exec -it $USER bash
}

options() {
  case $@ in
    -a|--useradd|-add)
      user_add
     ;;
     -e|--expire|-ex)
      password_expire
      ;;
     -d|--userdel|--del)
      user_del
      ;;
      -l|--lock)
      user_lock
      ;;
      -u|--unlock)
      user_unlock
      ;;
      -r|--run|--run)
      docker_run
      ;;
    *)
      echo "Unknown option"
      exit 1
  esac
}

options $@


#!/bin/bash
cat << EOF > /tmp/users.txt
tia
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')
function user_add() {
    for users in $username
    do
        ls /home |grep -w $users &>/dev/nul || mkdir -p /home/$users
        cat /etc/passwd |awk -F: '{print$1}' |grep -w $users &>/dev/nul ||  useradd $users
        chown -R $users:$users /home/$users
        usermod -s /bin/bash -aG docker $users
        echo -e "$users\n$users" |passwd "$users"
    done
}


password_expire() {
    for users in $username
    do
        passwd --expire $users
    done
}

user_del() {
    for users in $username
    do
        userdel -f $users
    done
}

user_lock() {
    for users in $username
    do
        usermod -s /sbin/nologin $users
        cat /etc/passwd |grep $users
    done
}

user_unlock() {
    for users in $username
    do
        usermod -s /bin/bash $users
        cat /etc/passwd |grep $users
    done
}


docker() {
    docker rm -f $(docker ps -aq)
    docker rmi -f $(docker images -aq)
    docker system prune -af
}

options() {
  case $@ in
    -a|--useradd|-add)
      user_add
     ;;
     -e|--expire|-ex)
      password_expire
      ;;
     -d|--userdel|--del)
      user_del
      ;;
      -l|--lock)
      user_lock
      ;;
      -u|--unlock)
      user_unlock
      ;;
      -docker)
      docker
      ;;
      -m|--mkdir)
      mkdir
      ;;
    *)
      echo "Unknown option"
      exit 1
  esac
}

options $@
