class UuidCli < Formula
  desc "Small CLI to generate UUID values"
  homepage "https://github.com/guzhongren/uuid-cli"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/guzhongren/uuid-cli/releases/download/v1.0.0/uuid-cli-v1.0.0-x86_64-apple-darwin.tar.gz"
    sha256 "d441edee441327130e35fd75e3a2845823e6b18353789f3517571331abaae593"
  elsif Hardware::CPU.arm?
    url "https://github.com/guzhongren/uuid-cli/releases/download/v1.0.0/uuid-cli-v1.0.0-aarch64-apple-darwin.tar.gz"
    sha256 "910ce29cb95d635a4417f7657d1829b70514db081b7e1c40da77b0c88555d9bb"
  end

  def install
    bin.install "uuid-cli"
  end

  test do
    output = shell_output("#{bin}/uuid-cli --count 1")
    assert_match(/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/, output.strip)
  end
end