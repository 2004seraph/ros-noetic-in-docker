FROM ubuntu:focal as base

# Override defaults so apt doesn't prompt for keyboard layout
ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -ms /bin/bash cccyan-ros
RUN usermod -aG sudo cccyan-ros
RUN echo cccyan-ros:password | chpasswd

# This takes easily >5 minutes, so it's in its own layer
RUN apt update && apt install -y software-properties-common xauth && apt-add-repository -y multiverse && apt update && apt-get -y install lsb-release gnupg && sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && apt -y install curl && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && apt update && apt install -y ros-noetic-desktop-full python3-catkin-tools python3-osrf-pycommon python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential && rosdep init && rosdep update && apt install -y ros-noetic-joy ros-noetic-teleop-twist-joy ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc ros-noetic-rgbd-launch ros-noetic-rosserial-arduino ros-noetic-rosserial-python ros-noetic-rosserial-client ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers ros-noetic-dynamixel-sdk ros-noetic-turtlebot3-msgs ros-noetic-turtlebot3 ros-noetic-turtlebot3-simulations python3-pip python3-scipy python3-pandas

RUN apt install -y eog neovim neofetch psmisc

FROM base as build

#WORKDIR /opt/ros/

# Source the ros setup script in bashrc and create Xauthority
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc && touch /root/.Xauthority

ENTRYPOINT '/bin/bash'

#RUN chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

RUN rosdep update

USER cccyan-ros
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && touch ~/.Xauthority
RUN echo "source ~/ros/ros-user-init.sh" >> ~/.bashrc
