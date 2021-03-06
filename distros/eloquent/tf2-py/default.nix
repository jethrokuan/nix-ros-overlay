
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-pytest, ament-lint-auto, builtin-interfaces, geometry-msgs, python-cmake-module, rclpy, tf2 }:
buildRosPackage {
  pname = "ros-eloquent-tf2-py";
  version = "0.12.5-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/geometry2-release/archive/release/eloquent/tf2_py/0.12.5-1.tar.gz";
    name = "0.12.5-1.tar.gz";
    sha256 = "a89f8bc4143650c6eea6ff94e6abe9d4f0cf53a8feba1d8cf14398edce3f77de";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-pytest ament-lint-auto ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy tf2 ];
  nativeBuildInputs = [ ament-cmake python-cmake-module ];

  meta = {
    description = ''The tf2_py package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
