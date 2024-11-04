class YsAT0182 < Formula
  version = '0.1.82'

  sha_lin_arm = '004d206b2b9a5bd4df2724587ec99a7751e9a70a31e01f490e927be6fae40ae6'
  sha_lin_int = 'd398330441f0fc94da37ba946eed4ae3288704da484709bd75b58524b3a5ed10'
  sha_mac_arm = '17049e09beaeb737ff53df5eb5efa682ad74cb90c85a9000ab101552886f7163'
  sha_mac_int = 'ac3b45aa5ee7714f630f99da65b2996015f728db59efd52f2acc48f5b9d8fee5'

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
