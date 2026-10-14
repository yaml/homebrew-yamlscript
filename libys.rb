class Libys < Formula
  desc "YAMLScript shared library"
  homepage "https://github.com/yaml/yamlscript"
  version "0.3.5"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-linux-x64.tar.xz"
      sha256 "8fcdd79ab8b7734c6856f058e2917371099eb37de04f7193846fac89feea0d5e"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-linux-aarch64.tar.xz"
      sha256 "faa235252bbdc8106cf7e5c12994ba7f3bce74710a35135ef97fbc02fa445348"
    else
      odie "libys is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/libys-#{version}-macos-arm64.tar.xz"
      sha256 "b2fd4b5b8ff99b0f27b58ddf3914114871fe83238c10252f348b668c1ef5b351"
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
