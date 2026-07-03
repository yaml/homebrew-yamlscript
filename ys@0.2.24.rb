class YsAT0224 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.24"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "8459445e55fadaa49205f715e06f5663301100a44875bc6e5d8e9bcd8a885309"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-aarch64.tar.xz"
      sha256 "18c250adff435878f9108c10622c4d73c8df91f58bd3a1166ee52a86eb43bece"
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
