class YsAT0215 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.15"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "9038345c7dc2bfe5a6bd326b4296f4865232f91caafca595cdedaaa0b9ae4d90"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-aarch64.tar.xz"
      sha256 "6b14b937a35932f8b36f554c535e18a6c3569021a2543ea7c3f7aca93a6f093d"
    else
      odie "YAMLScript is not available for this macOS architecture"
    end
  end

  def install
    bin.install "ys"
    bin.install "ys-0"
    bin.install "ys-#{version}"
  end

  test do
    assert_equal "YAMLScript #{version}\n",
      pipe_output("#{bin}/ys --version")
  end
end
