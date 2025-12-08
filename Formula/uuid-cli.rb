class UuidCli < Formula
  desc "Small CLI to generate UUID values"
  homepage "https://github.com/guzhongren/uuid-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/guzhongren/uuid-cli/releases/download/v1.1.1/uuid-cli-v1.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "412db63016f912eee0d79b6dfa4e273833977d87901714940c0a25e309178c3f"
    elsif Hardware::CPU.arm?
      url "https://github.com/guzhongren/uuid-cli/releases/download/v1.1.1/uuid-cli-v1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "2888f91b2d5ce1918a1b18a23fc48d90e9e7992e1e0204c274f9339020987e39"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/guzhongren/uuid-cli/releases/download/v1.1.1/uuid-cli-v1.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08a1f8dbe8cf0db2988da5d3a15e6ed48236b99b935ff0fe4b2331ebbf0edf66"
    elsif Hardware::CPU.arm?
      url "https://github.com/guzhongren/uuid-cli/releases/download/v1.1.1/uuid-cli-v1.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6de4b6f6956ed53968ced00f4cc72f55b9a453b5db790b9144cd566148344fce"
    end
  end

  def install
    bin.install "uuid-cli"
  end

  test do
    output = shell_output("#{bin}/uuid-cli --count 1")
    assert_match(/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/, output.strip)
  end
end