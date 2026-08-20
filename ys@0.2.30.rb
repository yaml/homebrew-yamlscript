class YsAT0230 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.2.30"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "84f5110280639c3313258e1fc02b0395127c5c3858361a775bb857ea44ae98da"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-aarch64.tar.xz"
      sha256 "258071564a1e284b928685c1d6779547cf6d2b61c300c130f235ab0b7893d415"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-aarch64.tar.xz"
      sha256 "197e1f0b180e983f7162cba0b8f9902e3ca04dac981f932dc09a02b35d85e897"
    else
      odie "YAMLScript is not available for this macOS architecture"
    end
  end

  def install
    bin.install "ys"
    bin.install "ys-0"
    bin.install "ys-#{version}"
    bin.install "ys-sh-#{version}"
  end

  def caveats
    <<~EOS
      To run 'ys -T bb' compiled scripts under babashka
      without java, install the ys.v0 jars into ~/.m2 with:
        ys-sh-#{version} --install-m2
    EOS
  end

  test do
    assert_equal "YAMLScript #{version}\n",
      pipe_output("#{bin}/ys --version")
  end
end
