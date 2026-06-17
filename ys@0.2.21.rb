class YsAT0221 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.21"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "eee890a6212badfcea4d4f101f05d26ae79333312f1415dd84e857d89d567bb9"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-aarch64.tar.xz"
      sha256 "a7e125dc66aedabd801e36376fba4928bae53cda7c55d1b6a8e9c77d354aeb76"
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
