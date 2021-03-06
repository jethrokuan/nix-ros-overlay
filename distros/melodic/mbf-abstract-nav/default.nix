
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, dynamic-reconfigure, geometry-msgs, mbf-abstract-core, mbf-msgs, mbf-utility, nav-msgs, roscpp, std-msgs, std-srvs, tf, xmlrpcpp }:
buildRosPackage {
  pname = "ros-melodic-mbf-abstract-nav";
  version = "0.3.2-r1";

  src = fetchurl {
    url = "https://github.com/uos-gbp/move_base_flex-release/archive/release/melodic/mbf_abstract_nav/0.3.2-1.tar.gz";
    name = "0.3.2-1.tar.gz";
    sha256 = "34c8bc49b61b4bfbdf54badb5ac8901819a389f181e13abe7f12719b87e9f284";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ actionlib actionlib-msgs dynamic-reconfigure geometry-msgs mbf-abstract-core mbf-msgs mbf-utility nav-msgs roscpp std-msgs std-srvs tf xmlrpcpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The mbf_abstract_nav package contains the abstract navigation server implementation of Move Base Flex (MBF). The abstract navigation server is not bound to any map representation. It provides the actions for planning, controlling and recovering. MBF loads all defined plugins at the program start. Therefor, it loads all plugins which are defined in the lists *planners*, *controllers* and *recovery_behaviors*. Each list holds a pair of a *name* and a *type*. The *type* defines which kind of plugin to load. The *name* defines under which name the plugin should be callable by the actions.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
