
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, python-qt-binding, python3Packages, rclpy, rqt-gui, rqt-gui-py }:
buildRosPackage {
  pname = "ros-eloquent-rqt-top";
  version = "1.0.0-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/rqt_top-release/archive/release/eloquent/rqt_top/1.0.0-1.tar.gz";
    name = "1.0.0-1.tar.gz";
    sha256 = "2621924da0e5cf1b7ea0fbe948b53835cf7cd778f1d0d22bf3d77966a25a3883";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ python-qt-binding python3Packages.psutil rclpy rqt-gui rqt-gui-py ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''RQT plugin for monitoring ROS processes.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
