class YsAT034 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.3.4"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "944b136bc265af0ed8fbac976a7b8554574fbee0be2c51a0a262ba0facc136a0"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-aarch64.tar.xz"
      sha256 "9f861df2e0c4e1e119e019b6ba340cc778b18d89919f5dece72bb57dd896d2b4"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-arm64.tar.xz"
      sha256 "6e8a9621fc56befb220243bd182337f698ffae89786f1637ba331930cc03c96f"
    else
      odie "YAMLScript is not available for this macOS architecture"
    end
  end

  def install
    bin.install "ys"
    bin.install "ys-0"
    bin.install "ys-#{version}"
  end

  def caveats
    <<~EOS
      To run 'ys -T bb' compiled scripts under babashka
      without java, install the ys.v0 jars into ~/.m2 with:
        ys --install-m2
    EOS
  end

  test do
    assert_equal "YAMLScript #{version}\n",
      pipe_output("#{bin}/ys --version")
  end
end
