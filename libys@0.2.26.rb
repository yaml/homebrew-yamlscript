class LibysAT0226 < Formula
  desc "YAMLScript shared library"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.26"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-linux-x64.tar.xz"
      sha256 "fab16fff48ba614451a85010924a47ec90e8901a85be1e5f26806bc78d763c23"
    else
      odie "libys is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-macos-aarch64.tar.xz"
      sha256 "b076264ad5523f50af25bb406df0d38ee0d61a53df01f3b10298d8bbaca28239"
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
