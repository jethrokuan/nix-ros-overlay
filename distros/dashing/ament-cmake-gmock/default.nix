
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core, ament-cmake-gtest, ament-cmake-test, gmock, gmock-vendor }:
buildRosPackage {
  pname = "ros-dashing-ament-cmake-gmock";
  version = "0.7.5-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/ament_cmake-release/archive/release/dashing/ament_cmake_gmock/0.7.5-1.tar.gz";
    name = "0.7.5-1.tar.gz";
    sha256 = "cdbb5245f8d9462438de155e33036749e6519e9e984b5781064b9d9a140f7f87";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-gtest ament-cmake-test gmock gmock-vendor ];
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''The ability to add Google mock-based tests in the ament buildsystem in CMake.'';
    license = with lib.licenses; [ asl20 ];
  };
}
