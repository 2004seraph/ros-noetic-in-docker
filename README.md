# ROS Noetic in Docker - A template project

## Files

- `init.sh` = run once after booting your machine.
- `start-command.sh` = source this file into your host machine's `.bashrc` to enable the `ros` command in your terminal.
 - The `ros` command will start an interactive terminal within your ROS Noetic docker container, ready to start development.
 - It can be run multiple times in different terminal windows, all instances connect to the same underlying Docker container.
 - It will make graphical programs like Gazebo function correctly. (Assuming you're using X.Org and have done the required setup for your host's graphics hardware/driver - more on this below).
- `ros-user-init.sh` = your .bashrc within the docker container (it is sourced within the Dockerfile).
 - Has some useful config and aliases preloaded as well.

## Notes

This entire repo directory is loaded into `/home/cccyan-ros/ros/` within the container as a volume, so any changes made outside the container will immediately be reflected from within it, meaning you can run your IDE on your host as normal, and use a container terminal to build, test, and access Noetic tooling. Edits from within the container will also persist as expected.

### Usage

- Clone this repo
- Tweak the `ros-user-init.sh` file to your liking
- Add `source /path/to/start-command.sh` to your `.bashrc` file
- Build the docker image
- Setup or clone your ROS Noetic project into the `catkin_ws` folder
- Run `ros` in any terminal you need a ROS Noetic developer environment
- Work within the `catkin_ws` folder as normal

### Graphical ROS Programs within the Container

This template assumes your computer uses the X.Org display server, as it gives the ROS container permission to access the host instance.

If you have an NVidia graphics card, you must install and correctly setup the [NVidia Container Runtime](https://developer.nvidia.com/container-runtime) for Docker.

AMD users may need to remove the entire `deploy` key in the `docker-compose.yml` for this to work.
