class LibysAT034 < Formula
  desc "YAMLScript shared library"
  homepage "https://github.com/yaml/yamlscript"
  version "0.3.4"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-linux-x64.tar.xz"
      sha256 "9faee1277acb82d3be624fbae5d905809ffc939dbca67da1574fd240871a1612"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-linux-aarch64.tar.xz"
      sha256 "2968694b5cdedc1fd12bb4191978e1125c057a6b7ec78cd8d2e3e218d41299b4"
    else
      odie "libys is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-macos-arm64.tar.xz"
      sha256 "c91dd1f5b2a491df95644566ccb66462be3c147ae71e11f48a1160d3ef5bdd37"
    else
      odie "libys is not available for this macOS architecture"
    end
  end

  def install
    lib.install Dir["libys*.so*"]
    lib.install Dir["libys*.dylib*"]
    (include/"libys-#{version}").install Dir["*.h"]
  end

  test do
    if OS.mac?
      assert_predicate lib/"libys.dylib", :exist?
    else
      assert_predicate lib/"libys.so", :exist?
    end
  end
end
