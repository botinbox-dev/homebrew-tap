# Homebrew formula for the BotInbox CLI.
#
# Canonical copy lives in the public tap: github.com/botinbox-dev/homebrew-tap (Formula/botinbox.rb).
# The template is kept next to the CLI source (cli/packaging/homebrew/) and rendered by
# render-formula.sh from each release's SHA256SUMS; .github/workflows/cli.yml pushes it to the tap.
#
#   brew install botinbox-dev/tap/botinbox
class Botinbox < Formula
  desc "Email inboxes for AI agents, from your terminal"
  homepage "https://botinbox.dev/app/cli"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/botinbox-dev/homebrew-tap/releases/download/cli-v0.2.0/botinbox_0.2.0_darwin_arm64.tar.gz"
      sha256 "85120c4c033d5074d6fef52cfd8f3dce367d9b3ed048611bd182a06ab0e26149"
    end
    on_intel do
      url "https://github.com/botinbox-dev/homebrew-tap/releases/download/cli-v0.2.0/botinbox_0.2.0_darwin_amd64.tar.gz"
      sha256 "24b8f98ce67f260b6fc038038dc0c5e873ed7829f96357010ba05096746c6cdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/botinbox-dev/homebrew-tap/releases/download/cli-v0.2.0/botinbox_0.2.0_linux_arm64.tar.gz"
      sha256 "172fd5f2500027db82818ed1dc8db7ede6ab34c26ff3fedd9aa6b2fde4104182"
    end
    on_intel do
      url "https://github.com/botinbox-dev/homebrew-tap/releases/download/cli-v0.2.0/botinbox_0.2.0_linux_amd64.tar.gz"
      sha256 "e78c370c417de7ec9e7463d555d6ef2c0e84ea17c96aa715585624a0709bcaae"
    end
  end

  def install
    bin.install "botinbox"
    generate_completions_from_executable(bin/"botinbox", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/botinbox version")
  end
end
