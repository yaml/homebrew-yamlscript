class YsAT024 < Formula
  version = '0.2.4'

  sha_lin_arm = 'fd1f4f345d560a7d279f939c9307e731a68ca4bfdcf6bb16cb06adf50b05d5aa'
  sha_lin_int = '19cec39076bd8c183fe005a2a1ab25f52d6c4b73b27fb7c10441f36158093ad6'
  sha_mac_arm = '187f122e278fa3ed0923b652b89fa72849db6a089efe986ed78489b0a32f1550'
  sha_mac_int = '19dc4d1c31448ff5ab641c40824573e2e766b72a5bca2fef09339e80b73ff68a'

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
