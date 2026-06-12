class YsAT0217 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.17"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "3cb30a17cddd452a2a0620721196885ff87df411bc54b620520c068e91f830da"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-aarch64.tar.xz"
      sha256 "d5ad9095fc4d7cb52eced49ec6fd242241769271d889474590a0b4a08d9628ae"
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
