
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, nav2-amcl, nav2-behavior-tree, nav2-bt-navigator, nav2-controller, nav2-core, nav2-costmap-2d, nav2-dwb-controller, nav2-lifecycle-manager, nav2-map-server, nav2-msgs, nav2-navfn-planner, nav2-planner, nav2-recoveries, nav2-rviz-plugins, nav2-util, nav2-voxel-grid, nav2-waypoint-follower }:
buildRosPackage {
  pname = "ros-foxy-navigation2";
  version = "0.4.3-r1";

  src = fetchurl {
    url = "https://github.com/SteveMacenski/navigation2-release/archive/release/foxy/navigation2/0.4.3-1.tar.gz";
    name = "0.4.3-1.tar.gz";
    sha256 = "72210833bc9284733350efc544d253d2ac80f7fa965e348be28acdbf43e37c6d";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ nav2-amcl nav2-behavior-tree nav2-bt-navigator nav2-controller nav2-core nav2-costmap-2d nav2-dwb-controller nav2-lifecycle-manager nav2-map-server nav2-msgs nav2-navfn-planner nav2-planner nav2-recoveries nav2-rviz-plugins nav2-util nav2-voxel-grid nav2-waypoint-follower ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''ROS2 Navigation Stack'';
    license = with lib.licenses; [ asl20 ];
  };
}
