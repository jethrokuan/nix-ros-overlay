
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, sensor-msgs, turtlebot3-bringup }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-slam";
  version = "1.2.2-r1";

  src = fetchurl {
    url = "https://github.com/ROBOTIS-GIT-release/turtlebot3-release/archive/release/melodic/turtlebot3_slam/1.2.2-1.tar.gz";
    name = "1.2.2-1.tar.gz";
    sha256 = "76d43c239f22319a4f86404e9dc69e5bdee1a4dba98f2aaaefd01ec20fbd563c";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ roscpp sensor-msgs turtlebot3-bringup ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The turtlebot3_slam package provides roslaunch scripts for starting the SLAM'';
    license = with lib.licenses; [ asl20 ];
  };
}
