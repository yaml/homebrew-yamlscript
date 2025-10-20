class YsAT026 < Formula
  version = '0.2.6'

  sha_lin_arm = '4042fbf979def0a781826fbe17de8944ee2059d98440b663d367b77082e8bb5a'
  sha_lin_int = '4802d840360cc1775ee81840761f9483218223f2eb0a808f112c3a4d224ac8d0'
  sha_mac_arm = '567ff60ba2bdc13b3ca655b36579674303613a20ed68ab129184acda7dd2aa57'
  sha_mac_int = '72161a470850c172b5d5e397a37d50d29bff074ff5da3e4a8c8d268ef2cdcc0e'

  download = 'https://github.com/yaml/yamlscript/releases/download'

  desc "Program in YAML — Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version version
  license "MIT"

  on_linux do
    if Hardware::CPU.arm?
      url "#{download}/#{version}/ys-#{version}-linux-aarch64.tar.xz"
      sha256 sha_lin_arm
    end

    if Hardware::CPU.intel?
      url "#{download}/#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 sha_lin_int
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "#{download}/#{version}/ys-#{version}-macos-aarch64.tar.xz"
      sha256 sha_mac_arm
    end

    if Hardware::CPU.intel?
      url "#{download}/#{version}/ys-#{version}-macos-x64.tar.xz"
      sha256 sha_mac_int
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
