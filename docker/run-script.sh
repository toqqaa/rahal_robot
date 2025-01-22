xhost local:root

XAUTH=/tmp/.docker.xauth
docker rm rahal_final_cont

docker run -it \
    --name=rahal_final_cont \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --volume="/home/toqa/rahal_robot/:/root/ros2_ws/src/rahal_robot/" \
    rahal_final \
    bash

echo "Done."
