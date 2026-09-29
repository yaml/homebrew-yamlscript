class YsAT033 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.3.3"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "e23d287eb7774812fa711f7162a3c371b06fa0bd7e0217774d9f1fdbcc2955ee"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-aarch64.tar.xz"
      sha256 "39d352b195aab00ddfd40e8482750470dfa493b948f7e4bac6c99f424c5dd95d"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-arm64.tar.xz"
      sha256 "e9ad61c5bbfaa109aaa4c9dc118c0efd22a89161b180b10193e2b3c3b1873659"
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
