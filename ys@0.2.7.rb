class YsAT027 < Formula
  version = '0.2.7'

  sha_lin_arm = '60022f44c4989c8818eca4b47f3faf40229dcfa7299a9b77f51df265e99c13b6'
  sha_lin_int = 'f0762980ad1945fa593495d801b62e1a56e6446ff09b82895724d51c7a86bd0f'
  sha_mac_arm = '8685f84fc12e1c85c365f234f026f32cbebfecc097d32ea70fc8a765f86a83ad'
  sha_mac_int = 'e11ad7be51679ede92a88ad00c9957b1481107d99d23a8221fe23645c574959e'

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
