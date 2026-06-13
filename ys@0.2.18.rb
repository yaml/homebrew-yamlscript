class YsAT0218 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.18"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "0ac3baca5d9c8871ced1e1d1fdaed9786f2ce05535d283ba3df3a98baa26ce3e"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-aarch64.tar.xz"
      sha256 "91f6ae3bbb4259815235fc4be9329d847cd1f447bfd80864f6d5032e2c2730ef"
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
