
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, can-msgs, catkin, rosconsole-bridge, roscpp, roslint, rostest, rosunit, socketcan-interface }:
buildRosPackage {
  pname = "ros-melodic-socketcan-bridge";
  version = "0.8.4-r1";

  src = fetchurl {
    url = "https://github.com/ros-industrial-release/ros_canopen-release/archive/release/melodic/socketcan_bridge/0.8.4-1.tar.gz";
    name = "0.8.4-1.tar.gz";
    sha256 = "3394960da4d9838b4ffae8fac173f728008548fa41868aa859c2bc180007ceb2";
  };

  buildType = "catkin";
  checkInputs = [ roslint rostest rosunit ];
  propagatedBuildInputs = [ can-msgs rosconsole-bridge roscpp socketcan-interface ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Conversion nodes for messages from SocketCAN to a ROS Topic and vice versa.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
