
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-gmock, ament-cmake-ros, ament-cmake-version, ament-lint-auto, ament-lint-common, osrf-testing-tools-cpp, rcutils, rosidl-runtime-c }:
buildRosPackage {
  pname = "ros-foxy-rmw";
  version = "1.0.1-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/rmw-release/archive/release/foxy/rmw/1.0.1-1.tar.gz";
    name = "1.0.1-1.tar.gz";
    sha256 = "594d8056a2f17e425af6ea17163c333cce53a233467517481e76d46af627e732";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  propagatedBuildInputs = [ rcutils rosidl-runtime-c ];
  nativeBuildInputs = [ ament-cmake-ros ament-cmake-version ];

  meta = {
    description = ''Contains the ROS middleware API.'';
    license = with lib.licenses; [ asl20 ];
  };
}
