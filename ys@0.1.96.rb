class YsAT0196 < Formula
  version = '0.1.96'

  sha_lin_arm = 'cdcc0ecf5b9d3b86d68773f9384f6b2784cc38706f791db2211b3104d57ded37'
  sha_lin_int = '8ebf20dee5b7abbc338c5a9fa3161b99423d4e6ccb3e0582d1fc8e7a23ddbc2b'
  sha_mac_arm = '5af3df535b7d70f3e8e976c0a0f79a9240e665866dd46ab30e4730967ba9ee57'
  sha_mac_int = 'd8df352e5b34505506343bc95af47d4137c389dd2e60c7c46e1311fb08ba4ae7'

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
