class YsAT0197 < Formula
  version = '0.1.97'

  sha_lin_arm = '0a949e2518bf6f1a24e0cd60ed0ad9da90c41240fc8b12fb0c3b67810a6b5877'
  sha_lin_int = 'fa98e66bed1c3e7562727cc822827bd42557c87daa40ca50d98f945346621214'
  sha_mac_arm = '6e621c23dab08c63e4e08cb6a9e72e15cd948f8774fc4d167919371a84831f4c'
  sha_mac_int = 'ac2b7864ee1b99dad538148093196cb34a5c67285398db67ce918eefc18877a9'

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
