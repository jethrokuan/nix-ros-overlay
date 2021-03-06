
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core }:
buildRosPackage {
  pname = "ros-foxy-test-interface-files";
  version = "0.8.0-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/test_interface_files-release/archive/release/foxy/test_interface_files/0.8.0-1.tar.gz";
    name = "0.8.0-1.tar.gz";
    sha256 = "21839e5ca18524056a5e386ffeefa4923f2a9813a3cbf2502bdbc5a47d283568";
  };

  buildType = "ament_cmake";
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''A package containing message definitions and fixtures used exclusively for testing purposes.'';
    license = with lib.licenses; [ asl20 ];
  };
}
