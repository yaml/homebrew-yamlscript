class YsAT035 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.3.5"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "ba4a24b079fded6a71f4576123871a14c4c90b28dc4187530d2f372e6d021580"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-aarch64.tar.xz"
      sha256 "2397687fe7259aa40ecc3d0cd0281228399a9930375aed03e63527fd75c80127"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-arm64.tar.xz"
      sha256 "3ac7f534aa89c82d7179da25f572cf4a3fda7585d26975438f40af62f5e5dbb8"
    else
      odie "YAMLScript is not available for this macOS architecture"
    end
  end

  def install
    bin.install "ys"
    bin.install "ys-0"
    bin.install "ys-#{version}"
  end

  def caveats
    <<~EOS
      To run 'ys -T bb' compiled scripts under babashka
      without java, install the ys.v0 jars into ~/.m2 with:
        ys --install-m2
    EOS
  end

  test do
    assert_equal "YAMLScript #{version}\n",
      pipe_output("#{bin}/ys --version")
  end
end
