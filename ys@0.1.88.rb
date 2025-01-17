class YsAT0188 < Formula
  desc "Program in YAML — Code is Data"
  homepage "https://yamlscript.org"
  version "0.1.88"
  license "MIT"
  repo = "https://github.com/yaml/yamlscript"
  head "#{repo}.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  sha_mac_arm = "eddcb16690054007204d4cf207ceffc9ebd87f851b97d0e6714ff2e2d795286f"
  sha_mac_int = "1f2820e9a6dda953c5ecf88ca1f2f48a1b68c5bf74f26ecf6f8df6eee6381f0a"
  sha_lin_arm = "066fc0e33b1c7f4ce98d3af12ab0e3ea37ed66b8f7c1bc2268b74fb7379f4598"
  sha_lin_int = "52936f13f8f9bc9b243c2436b293be7354ff3589c2f6c1ad44a291dc46ddafc5"

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
