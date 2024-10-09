class YsAT0180 < Formula
  version = '0.1.80'

  sha_lin_arm = 'c3c502e7cb88f48c6609ac1b760b745b566f10f6b404e0f650359f74fcf22c6e'
  sha_lin_int = 'd140fbbd537dfe12ac051f744b7f5111cfaf6ad56ccbdd7e0aef99f165812a45'
  sha_mac_arm = '1f2a6bbd7dc69661455aad3e84d1b9c7036759c7f9883b5a8f9be3a4d7b6873e'
  sha_mac_int = '5f76bdfec67e7b229a2c9a2a791ebb07dc0cea6d96caf7043224c19eb7dbeb52'

  download = 'https://github.com/yaml/yamlscript/releases/download'

  desc ""
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
