
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-interface, controller-manager, four-wheel-steering-msgs, nav-msgs, pluginlib, realtime-tools, rosgraph-msgs, rostest, std-srvs, tf, urdf-geometry-parser }:
buildRosPackage {
  pname = "ros-melodic-four-wheel-steering-controller";
  version = "0.17.0-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/ros_controllers-release/archive/release/melodic/four_wheel_steering_controller/0.17.0-1.tar.gz";
    name = "0.17.0-1.tar.gz";
    sha256 = "0190bb52d9a25d3a77ff015b2b1b69c0f16eb04f065a1b2409b79f45b517b34d";
  };

  buildType = "catkin";
  checkInputs = [ controller-manager rosgraph-msgs rostest std-srvs ];
  propagatedBuildInputs = [ controller-interface four-wheel-steering-msgs nav-msgs pluginlib realtime-tools tf urdf-geometry-parser ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Controller for a four wheel steering mobile base.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
