
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, angles, catkin, cob-srvs, geometry-msgs, move-base-msgs, nav-msgs, roscpp, tf }:
buildRosPackage {
  pname = "ros-kinetic-cob-linear-nav";
  version = "0.6.10-r1";

  src = fetchurl {
    url = "https://github.com/ipa320/cob_navigation-release/archive/release/kinetic/cob_linear_nav/0.6.10-1.tar.gz";
    name = "0.6.10-1.tar.gz";
    sha256 = "9485d9e75fdeaa431e7aa4bd1ef7e3df483e7f3d76fb8d4a53125752dbb95aaf";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ actionlib angles cob-srvs geometry-msgs move-base-msgs nav-msgs roscpp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''cob_linear_nav provides a simple navigation instrument driving on a linear path from current position to goal without any planning or obstacle avoidance capabilites.
    Obstacle avoidance should be carried out in other package, e.g. <a href="http://ros.org/wiki/cob_collision_velocity_filter">cob_collision_velocity_filter</a>.'';
    license = with lib.licenses; [ asl20 ];
  };
}
