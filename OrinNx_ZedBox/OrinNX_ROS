# Suporte do ROS na Orin NX

```shell
sudo apt install docker.io -y
sudo usermod -aG docker $USER
newgrp docker
sudo apt install -y nvidia-docker2
sudo systemctl restart docker
docker pull ros:noetic-ros-base
docker pull ros:humble-ros-base
docker pull nvcr.io/nvidia/l4t-ros:ros-noetic
FROM nvcr.io/nvidia/l4t-ros:ros-noetic

# Instale dependências para SLAM
RUN apt update && apt install -y \
    ros-noetic-slam-gmapping \
    ros-noetic-hector-slam \
    ros-noetic-cartographer \
    ros-noetic-rtabmap-ros \
    ros-noetic-navigation

# Configurar o workspace do ROS
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make"

# Configurar o entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
```
