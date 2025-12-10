class UuidCli < Formula
  desc "Small CLI to generate UUID values"
  homepage "https://github.com/guzhongren/uuid-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/guzhongren/uuid-cli/releases/download/v1.1.2/uuid-cli-v1.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "d8740d6e7bc55b9a27f0700285cc1195819b6ad7025037bbf0700c2e94eb1eda"
    elsif Hardware::CPU.arm?
      url "https://github.com/guzhongren/uuid-cli/releases/download/v1.1.2/uuid-cli-v1.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "73dc80d29a6620a5cb6f088e8707da1a319fdc18e9583557fb7840fa3769e387"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/guzhongren/uuid-cli/releases/download/v1.1.2/uuid-cli-v1.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32e937974c0f1e5b033ae4ebc24bee71264ca7e3efadc481d598bc84b08cc853"
    elsif Hardware::CPU.arm?
      url "https://github.com/guzhongren/uuid-cli/releases/download/v1.1.2/uuid-cli-v1.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de89bd2bc83f91dc04caefd37fdbd7ad34e734e23e576522b50b8d60861950b2"
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