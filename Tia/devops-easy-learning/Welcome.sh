IMAGE_TAG="devopseasylearning2021/master-ubuntu-image:03.2"
docker rm -f $USER || true >&/dev/null
docker run -itd \
    --name $USER \
    --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "${HOME}":/student_home \
    -w "/student_home" \
    -h ${USER}@EK-TECH-SERVER02 \
     ${IMAGE_TAG}

clear

echo -e "
\033[1;36m

                *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*==*=*
                *                    **** Warning ***                                      *
                *  This computer system is the private property of DevOps Easy Learning    *
                *  It is for authorized use only.                                          *
                *                                                                          *
                *  Unauthorized or improper use of this system may result in civil and     *
                *  criminal penalties and administrative or disciplinary action, as        *
                *  appropriate. By continuing to use this system you indicate your         *
                *  awareness of and consent to these terms and conditions of use. LOG OFF  *
                *  IMMEDIATELY if you do not agree to the conditions stated in this        *
                *  warning!!!!!                                                            *
                *  For support please contact support@devopseasylearning.com or call:      *
                *       Tia Leonard: 832 897 8630   OR   Eric Kemvou: 832 342 0700         *
                *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*==*=*

\033[0m
"
echo
sleep 3
echo "Validating credentials and permissions for user $USER, ... please wait ...."
sleep 3
echo
echo "... ... ... $USER, good news we found you in our database........."
sleep 3
echo
echo "Contacting Devops Easy Learning main servers on behalf of user $USER ..................."
echo
sleep 5
echo "Setting up $USER  environment on one of DevOps Easy Learning main servers ....Please wait............."
echo
sleep 5
echo "$USER,  your are  all set   *******HAPPY LEARNING************ "
echo
echo "$USER,  your are  all set   **HAPPY LEARNING***** "
sleep 3
echo
echo "$USER remember work hard and follow instructions, and you will definitely become an IT PRO"
echo
sleep 4
clear
