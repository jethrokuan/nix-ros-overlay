# Top level package set
self:
# Distro package set
rosSelf: rosSuper: with rosSelf.lib; {
  apriltag = rosSuper.apriltag.overrideAttrs ({
    patches ? [], ...
  }: {
    patches = patches ++ [
      # Fix assumption that CMAKE_INSTALL_INCLUDEDIR is relative
      (self.fetchpatch {
        url = "https://github.com/lopsided98/apriltag/commit/a6a5da0c834f5091f141c2088c1985876d0f9faa.patch";
        sha256 = "0pjfp6qk2rsvy36gzag1ny511cl52l80r76blckn2p1rpi78i68a";
      })
    ];
  });

  cv-bridge = (patchBoostPython rosSuper.cv-bridge).overrideAttrs ({
    patches ? [],
    propagatedBuildInputs ? [], ...
  }: {
    patches = patches ++ [ (self.fetchpatch {
      url = "https://github.com/ros-perception/vision_opencv/commit/fbfb25303bd77db6a5943043cc4303d0c0b835c9.patch";
      sha256 = "0pznlbqp99f6bzql3q1sjy9sqk2746wgp7qdqj790j5z0vb2v2r6";
      stripLen = 1;
    }) ];
    propagatedBuildInputs = propagatedBuildInputs ++ [ rosSelf.pythonPackages.opencv3 ];
  });

  gazebo = self.gazebo_9;

  pcl-ros = rosSuper.pcl-ros.overrideAttrs ({
    patches ? [], ...
  }: {
    patches = patches ++ [
      # Fix build with PCL >=1.11
      (self.fetchpatch {
        url = "https://github.com/ros-perception/perception_pcl/commit/e812d3cf1b67cc73841b41e690d53c74e5077a05.patch";
        sha256 = "0savdifw90ql34zh6rff53hx3cy6rlmrwqzw80fsihkirls84b3w";
        stripLen = 1;
      })
    ];
  });

  rosfmt = patchVendorUrl rosSuper.rosfmt {
    url = "https://github.com/fmtlib/fmt/releases/download/6.0.0/fmt-6.0.0.zip";
    sha256 = "0h148anbaqgch6n69pxsvs1c9wmykgd052wmzgdia7qpz8w6p8dl";
  };
}
