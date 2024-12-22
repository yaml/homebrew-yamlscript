class YsAT0181 < Formula
  desc "Program in YAML — Code is Data"
  homepage "https://yamlscript.org"
  version "0.1.81"
  license "MIT"
  repo = "https://github.com/yaml/yamlscript"
  head "#{repo}.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  sha_mac_arm = "d7bbbaeb827f22d9bd50bd798c6eda8b44690add7d929a5036437c2717587eb6"
  sha_mac_int = "e5176cd5e43df2269294e78e4e53657d455531c2fa9063e10a110fb7394e6a4c"
  sha_lin_arm = "ee7087dad211e8a854309828470922270640ba841f53c7ae58c48b2316c64f7d"
  sha_lin_int = "dc8645f055afcd652a7e371c1bc87da447c90dd88dab1704874757280c8fbea6"

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
