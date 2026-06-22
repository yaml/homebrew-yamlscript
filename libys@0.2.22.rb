class LibysAT0222 < Formula
  desc "YAMLScript shared library"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.22"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-linux-x64.tar.xz"
      sha256 "0b4887c8f1acc0de15512f0acbfa73c6fc6a0b8245255c9ad5593df554070a3a"
    else
      odie "libys is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-macos-aarch64.tar.xz"
      sha256 "b445120e953458b94f2ec2b77476865fbd24ea49d892ce11195f57a0d269ec82"
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
