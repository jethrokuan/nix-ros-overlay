
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, python3Packages, ament-lint-common, ament-cmake, ament-lint-auto, ament-cmake-pytest, python-qt-binding }:
buildRosPackage {
  pname = "ros-eloquent-qt-dotgraph";
  version = "1.0.7-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/qt_gui_core-release/archive/release/eloquent/qt_dotgraph/1.0.7-1.tar.gz";
    name = "1.0.7-1.tar.gz";
    sha256 = "40dca3461dc462e323303b6ae277203af0c2d2b7f9ab0fad0afaf6bec462b632";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-lint-auto ament-lint-common python3Packages.pygraphviz ament-cmake-pytest ];
  propagatedBuildInputs = [ python3Packages.pydot python-qt-binding ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''qt_dotgraph provides helpers to work with dot graphs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}