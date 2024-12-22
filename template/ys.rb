class CLASS < Formula
  desc "Program in YAML — Code is Data"
  homepage "https://yamlscript.org"
  version "VERSION"
  license "MIT"
  repo = "https://github.com/yaml/yamlscript"
  head "#{repo}.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  sha_mac_arm = "MAC_ARM"
  sha_mac_int = "MAC_INT"
  sha_lin_arm = "LIN_ARM"
  sha_lin_int = "LIN_INT"

  download = "#{repo}/releases/download"

  on_macos do
    on_arm do
      url "#{download}/#{version}/ys-#{version}-macos-aarch64.tar.xz"
      sha256 sha_mac_arm
    end
    on_intel do
      url "#{download}/#{version}/ys-#{version}-macos-x64.tar.xz"
      sha256 sha_mac_int
    end
  end
  on_linux do
    on_arm do
      url "#{download}/#{version}/ys-#{version}-linux-aarch64.tar.xz"
      sha256 sha_lin_arm
    end
    on_intel do
      url "#{download}/#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 sha_lin_int
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
