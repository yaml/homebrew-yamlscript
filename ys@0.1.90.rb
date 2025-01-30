class YsAT0190 < Formula
  version = '0.1.90'

  sha_lin_arm = '2275d1fee4cb6ceec04adf4b9a12f53c2959b9708f7858ef67430cd478dab6b8'
  sha_lin_int = 'e2ef2352282f13aeec09c018d148798920c32c3b4207b874b4fe041fcdd85213'
  sha_mac_arm = 'f6c14b696c9bee64cd56dd60dd0fb6dd065a71db1c9ad895acf155ed2b637621'
  sha_mac_int = '97fe7c2a2ec063399b22860538b37ff653d9eea991c2ce6408dac6f8eae379ff'

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
