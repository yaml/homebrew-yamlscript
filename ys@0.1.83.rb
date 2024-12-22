class YsAT0183 < Formula
  desc "Program in YAML — Code is Data"
  homepage "https://yamlscript.org"
  version "0.1.83"
  license "MIT"
  repo = "https://github.com/yaml/yamlscript"
  head "#{repo}.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  sha_mac_arm = "ae65ca430ef8648075b09f1c54d75e9221f01654fcca75be9b07c5f07ce13a52"
  sha_mac_int = "1081b1021848bb538d063c826f51cbfee484e7b2a178ae942d34cef90fd8bbe5"
  sha_lin_arm = "f1e2df473b517939006d49fa4232c555ccf8352faac3016750b187e0039e1390"
  sha_lin_int = "8ad5097828aef72126069b7a00c1937dc59fbf9fc50f6a7029949bc6c7018fe3"

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
