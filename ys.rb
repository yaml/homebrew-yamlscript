class Ys < Formula
  version = '0.1.94'

  sha_lin_arm = 'f041e3d325e1fbcf66397994f2cb2884825bddc4f7d3a8cb9051470c7c1110ee'
  sha_lin_int = 'ef2ddb5d4af1e91c3ab3502b3c78f28ec4e7efee5038192643d09669be0b7e18'
  sha_mac_arm = 'c50ec0e428670241a298da5f1c1da0c3988d7252e95fe3273fa1697d18fd1f2e'
  sha_mac_int = 'de08fd8486f9baad69684deb375944958c4101c4dfce9eb510f0d5a6313698c8'

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
