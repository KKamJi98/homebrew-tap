class SshConnector < Formula
  desc "Pick a host from your ~/.ssh/config in a table and connect to it with ssh"
  homepage "https://github.com/KKamJi98/ssh-connector"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/KKamJi98/ssh-connector/releases/download/v0.4.1/ssh-connector-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "6dabef6603e6c7361e34e1bdb928cb0a0fac3115038cd4c946c7f233dc2b9909"
    end
    on_intel do
      url "https://github.com/KKamJi98/ssh-connector/releases/download/v0.4.1/ssh-connector-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "bceebc40c95596db9e71bede660a27befb7fa46688420f69a6ef4482aaa6df3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KKamJi98/ssh-connector/releases/download/v0.4.1/ssh-connector-v0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "951207a1c62f4f30c0f6208eb290dcecd8a5a7cb078a8ebdf5cffc7a92eef152"
    end
    on_intel do
      url "https://github.com/KKamJi98/ssh-connector/releases/download/v0.4.1/ssh-connector-v0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b0bb482d0ef80d5f84450e39773c43d905edc799c6eb247df2901aeefd950614"
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
