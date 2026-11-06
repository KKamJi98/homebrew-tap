class SshConnector < Formula
  desc "Pick a host from your ~/.ssh/config in a table and connect to it with ssh"
  homepage "https://github.com/KKamJi98/ssh-connector"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/KKamJi98/ssh-connector/releases/download/v0.4.0/ssh-connector-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "fb29b21cd2f8c1d7d64008024059fc78d28f2b7726db633285701dc7d9f76d73"
    end
    on_intel do
      url "https://github.com/KKamJi98/ssh-connector/releases/download/v0.4.0/ssh-connector-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "ac09be79316a63089379a87a10379c08fd86eb2fab7309167e0c929a0a6ca047"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KKamJi98/ssh-connector/releases/download/v0.4.0/ssh-connector-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f289410ad230c665753deed6eb72003e397812974192424a2d82d7ca206c3dd5"
    end
    on_intel do
      url "https://github.com/KKamJi98/ssh-connector/releases/download/v0.4.0/ssh-connector-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "52e84242cf9c4d60ceca0b0bb305e77fc93a4eb1f1aefa286ff444a0c37356e5"
    end
  end

  def install
    bin.install "ssh-connector"
    generate_completions_from_executable(bin/"ssh-connector", shell_parameter_format: :clap)
  end

  test do
    assert_match "Usage: ssh-connector", shell_output("#{bin}/ssh-connector --help")
  end
end
