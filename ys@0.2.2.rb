class YsAT022 < Formula
  version = '0.2.2'

  sha_lin_arm = 'ce286351d42dde0072e95b7e5260d814efee703ca43fbf18f07d9626b6b1d911'
  sha_lin_int = 'e9f771ad29f420e4988a41575309e38593575270fe3ea816de92b1b4913d64c1'
  sha_mac_arm = '5419d84da07b26351fb76641c7995191f9529ef212a365bc9ec9e7984f0c4586'
  sha_mac_int = 'dbf164b7692035ff134f1e8dc2442dfaa5fbf417a62b32dc7273eccde9ae4113'

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
