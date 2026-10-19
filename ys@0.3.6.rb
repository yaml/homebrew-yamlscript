class YsAT036 < Formula
  desc "Program in YAML - Code is Data"
  homepage "https://github.com/yaml/yamlscript"
  version "0.3.6"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-x64.tar.xz"
      sha256 "8186d98f1d567f9c93bcb023e66cbbb38b490db6aa232e988b0e884bd4270841"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-linux-aarch64.tar.xz"
      sha256 "2f09811dff77f5a8a1f766f18c07a96452bcbef449acc7ec687f6f22ad63ef53"
    else
      odie "YAMLScript is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlscript/releases/download/" \
        "#{version}/ys-#{version}-macos-arm64.tar.xz"
      sha256 "a3815fe643e3250865bf715aa01be2f9f6549cfbb1f3221a04597299a1df67e8"
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
