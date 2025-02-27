class YsAT0193 < Formula
  version = '0.1.93'

  sha_lin_arm = 'a59746c6266e75d8435a752c60f68da84601f290fae040fc1b6e831f8f8a6ad8'
  sha_lin_int = '44a698dea0cf55149b9ac144f57f64ad53609ef029e5b9b07aac2ae0e8d3e951'
  sha_mac_arm = 'd8effc8badb82fc7d4316e0eb69195ef2b792473ab20c608931737a674f18fcb'
  sha_mac_int = 'd43cf899a02582683011982f5c59a3d1955e660981b8812a5922eb3d1f2df07d'

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
