class LibysAT0230 < Formula
  desc "YAMLScript shared library"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.30"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-linux-x64.tar.xz"
      sha256 "95b72db06e9e4896022b6e6c8bc367c355160cc299507710ae85feb48472eaac"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-linux-aarch64.tar.xz"
      sha256 "c57f8abd235ca5aa496786bd878e7b47f9ad1528836b205c40c8ed4086dfba9b"
    else
      odie "libys is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-macos-aarch64.tar.xz"
      sha256 "548f5fd567a00d4a08e5a8a59a7e1cf0ca54ab07fea480d8a12656a70416be8f"
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
