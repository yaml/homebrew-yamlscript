class YsAT0187 < Formula
  version = '0.1.87'

  sha_lin_arm = '7f795d3abdc0d716d4048c2433ed944334dbaba55376c5c3015490fef990aa55'
  sha_lin_int = 'f1f3c6351413e5bf8eb04d19cf94444e0c26d7d98a3a0be3c1bae632378bc43c'
  sha_mac_arm = 'fd26ff63616287063538c375e7494a0b5f70a679c4f32a72dd2a0e8d4f924492'
  sha_mac_int = 'ac99a7d205a227dd98ccd2fd4daf391a0a3b471792a9eedcebf1efe616e766eb'

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
