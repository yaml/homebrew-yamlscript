class YsAT0179 < Formula
  version = '0.1.79'

  sha_lin_arm = 'a4f9cb4c688cd8b57d0a795721710007911e037dd0be2af6f875a5218bb88acf'
  sha_lin_int = '6f4236a618f53b2c5142cb637053134bfb50b466190a9f3eaf33adb9db16284f'
  sha_mac_arm = '84eb05aa69a81e3126f45e3436d9e4293979f669b53bf015c5ddd1aedfe7706c'
  sha_mac_int = 'c23cba27fe8fc9e12b7d0a5a335b209a2df68a35cc8e020f69cdade6213ce572'

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
