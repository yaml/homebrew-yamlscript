class YsAT0184 < Formula
  version = '0.1.84'

  sha_lin_arm = 'bf16504e41ffc4624945ed3f71151a51b9bc4b04b13ef65af704549e8a2bfa71'
  sha_lin_int = 'cce77b9bade8e78214fdcb9af87babb909b86c90422b581691aa87f711ff20ba'
  sha_mac_arm = 'bee5105bfebd39fb0b42ce87f9c9f469491a6f22cb1a9352585b626d48050368'
  sha_mac_int = 'aab225a70a1d138af618223eafd69abf51a1dd5a890e90526c2b65f09a9984b6'

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
