
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-rosmake";
  version = "1.15.6-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/ros-release/archive/release/noetic/rosmake/1.15.6-1.tar.gz";
    name = "1.15.6-1.tar.gz";
    sha256 = "9514440419b8559d52e985f991009c96227b1e7148f07af5c502cea93663fbf0";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ catkin python3Packages.rospkg ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''rosmake is a ros dependency aware build tool which can be used to
     build all dependencies in the correct order.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
