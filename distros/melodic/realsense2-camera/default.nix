
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, ddynamic-reconfigure, diagnostic-updater, eigen, genmsg, image-transport, librealsense2, message-runtime, nav-msgs, nodelet, roscpp, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-realsense2-camera";
  version = "2.2.16-r1";

  src = fetchurl {
    url = "https://github.com/IntelRealSense/realsense-ros-release/archive/release/melodic/realsense2_camera/2.2.16-1.tar.gz";
    name = "2.2.16-1.tar.gz";
    sha256 = "fae09067f458d9fffe461062541b1d00c370e614b07ccda34432fbfea777c22a";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ cv-bridge ddynamic-reconfigure diagnostic-updater eigen genmsg image-transport librealsense2 message-runtime nav-msgs nodelet roscpp sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RealSense Camera package allowing access to Intel T265 Tracking module and SR300 and D400 3D cameras'';
    license = with lib.licenses; [ asl20 ];
  };
}
