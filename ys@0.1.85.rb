class YsAT0185 < Formula
  version = '0.1.85'

  sha_lin_arm = '704b1ef04ab1b5d19382cf1f3ea0fe3db6e0e5786d6c89a7da2236308efe1be5'
  sha_lin_int = '59128eaf49344d32b9795d8db4645ec2896939d625050c51ff9f9301e6b2aa14'
  sha_mac_arm = 'd9ba07de90a9e9880a6783011efa294fb6c5c59a9bc3915e89a0a4389dc9cb86'
  sha_mac_int = 'c0117ce8a1b923d0ca14619f49f1fb48161ed81094da5da56356cbcb4b89b2f8'

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
