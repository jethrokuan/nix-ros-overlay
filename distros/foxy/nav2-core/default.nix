
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-cmake-pytest, ament-lint-auto, ament-lint-common, geometry-msgs, launch, launch-testing, nav-msgs, nav2-common, nav2-costmap-2d, nav2-util, pluginlib, rclcpp, rclcpp-lifecycle, std-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-foxy-nav2-core";
  version = "0.4.3-r1";

  src = fetchurl {
    url = "https://github.com/SteveMacenski/navigation2-release/archive/release/foxy/nav2_core/0.4.3-1.tar.gz";
    name = "0.4.3-1.tar.gz";
    sha256 = "2ed09d28318045aef089bfadb0aa0e9f1a9ce850792e595b0b39c3cebbd98d6f";
  };

  buildType = "ament_cmake";
  buildInputs = [ nav2-common ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs nav2-costmap-2d nav2-util pluginlib rclcpp rclcpp-lifecycle std-msgs tf2-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A set of headers for plugins core to the navigation2 stack'';
    license = with lib.licenses; [ asl20 ];
  };
}
