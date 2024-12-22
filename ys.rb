class Ys < Formula
  desc "Program in YAML — Code is Data"
  homepage "https://yamlscript.org"
  version "0.1.86"
  license "MIT"
  repo = "https://github.com/yaml/yamlscript"
  head "#{repo}.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  sha_mac_arm = "4fd0ee35d9d73e6c7578f05447a977767116419874af38a10f450221409b36ba"
  sha_mac_int = "b028cb93843e0563101b22f36b342f949ac50ed481a95a71c98142a87c46461f"
  sha_lin_arm = "6a0682546dd3837d9db73624b7d8d0506e9160c5deb10341e3b292afccd30ebb"
  sha_lin_int = "c95cbf3a7a1e1fcf5b3da32152ea4ccf019445ed408e7ca40e1a4dcc824618a7"

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
