class UuidCli < Formula
  desc "Small CLI to generate UUID values"
  homepage "https://github.com/guzhongren/uuid-cli"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/guzhongren/uuid-cli/releases/download/v0.1.0/uuid-cli-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "c4d8ea9c18da39febc8f7593c592c2c86e0f73c4f62c228bbc568f3c4accafef"
  elsif Hardware::CPU.arm?
    url "https://github.com/guzhongren/uuid-cli/releases/download/v0.1.0/uuid-cli-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "e656f5f99f70b6b743b0dd7e8acbf177d76b5744700b85d5b5cba87fd4cd7957"
  end

  def install
    bin.install "uuid-cli"
  end

  test do
    output = shell_output("#{bin}/uuid-cli --count 1")
    assert_match(/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/, output.strip)
  end
end