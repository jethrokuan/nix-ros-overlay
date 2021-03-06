
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, message-runtime, roscpp, roslaunch, rospy, rostest, rviz-visual-tools, toposens-description, toposens-driver, toposens-msgs }:
buildRosPackage {
  pname = "ros-melodic-toposens-markers";
  version = "2.0.3-r1";

  src = fetchurl {
    url = "https://gitlab.com/toposens/public/toposens-release/repository/archive.tar.gz?ref=release/melodic/toposens_markers/2.0.3-1";
    name = "archive.tar.gz";
    sha256 = "4f3f0d52a826a8a6d11afa65b9860bbd4e852659f1a9bd915e7396c03d0cb9dd";
  };

  buildType = "catkin";
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ dynamic-reconfigure message-runtime roscpp rospy rviz-visual-tools toposens-description toposens-driver toposens-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Rviz integration for TS sensor data.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
