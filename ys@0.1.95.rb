class YsAT0195 < Formula
  version = '0.1.95'

  sha_lin_arm = '9c5f146a4e23a2ecd1188b6d4387e4f05cacd666012f5792c13dcbacfaae2595'
  sha_lin_int = '04a98d1e034c479534f106a9212b3555aeb7ea2da13ed7b05a7528cf1897cba4'
  sha_mac_arm = '7f715c8fce1292ca32112cd84d0f4352e76c31e82c7303385d683b86f45e5864'
  sha_mac_int = 'f9401d08ffb1845a11419014b8bbcb699b22394c2543bb40dfe2b00957f43389'

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
