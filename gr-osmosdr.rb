class GrOsmosdr < Formula
  desc "GNU Radio hardware support for OsmoSDR and other devices"
  homepage "http://sdr.osmocom.org/trac/wiki/GrOsmoSDR"

  #url "https://gitea.osmocom.org/sdr/gr-osmosdr/archive/v0.2.3.tar.gz" #1
  #url "http://git.osmocom.org/gr-osmosdr/snapshot/gr-osmosdr-0.1.4.tar.xz" #2
  #sha256 "dc36848d6f9ad8c0f11e55939c8ff759b682351a0ca0791b9b3a3ddcaf87e9b6" #1
  #sha256 "1945d0d98fd4b600cb082970267ec2041528f13150422419cbd7febe2b622721" #2
  head "https://gitea.osmocom.org/gr-osmosdr.git"

  #resource "Markdown" do
  #  url "https://files.pythonhosted.org/packages/1d/25/3f6d2cb31ec42ca5bd3bfbea99b63892b735d76e26f20dd2dcc34ffe4f0d/Markdown-2.6.8.tar.gz"
  #  sha256 "0ac8a81e658167da95d063a9279c9c1b2699f37c7c4153256a458b3a43860e33"
  #end

  #resource "Cheetah" do
  #  url "https://files.pythonhosted.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz"
  #  sha256 "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
  #end

  depends_on "cmake" => :build
  depends_on "gnuradio"
  depends_on "gr-fosphor"
  depends_on "pybind11"
  depends_on "qt@5"
  #depends_on "gr-iqbal"
  depends_on "librtlsdr"
  #depends_on "pothosware/pothos/soapysdr"

  def install
    #ENV["CHEETAH_INSTALL_WITHOUT_SETUPTOOLS"] = "1"
    #ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    #resources.each do |r|
    #  r.stage do
    #    system "python", *Language::Python.setup_install_args(libexec)
    #  end
    #end

    mkdir "build" do
      # ENV.append "LDFLAGS", "-Wl,-undefined,dynamic_lookup"
      # Point Python library to existing path or CMake test will fail.
      args = %W[
        -DQt5_DIR='#{HOMEBREW_PREFIX}/lib/cmake/Qt5'
      ] + std_cmake_args

      #args = %W[
      #  -DCMAKE_SHARED_LINKER_FLAGS='-Wl,-undefined,dynamic_lookup'
      #  -DQt5_DIR='#{HOMEBREW_PREFIX}/lib/cmake/Qt5'
      #  -DPYTHON_LIBRARY='#{HOMEBREW_PREFIX}/lib/libgnuradio-runtime.dylib'
      #] + std_cmake_args
      
      
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
