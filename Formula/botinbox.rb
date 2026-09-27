# Homebrew formula for the BotInbox CLI.
#
# Canonical copy lives in the public tap: github.com/h4ux/homebrew-tap (Formula/botinbox.rb).
# The template is kept next to the CLI source (cli/packaging/homebrew/) and rendered by
# render-formula.sh from each release's SHA256SUMS; .github/workflows/cli.yml pushes it to the tap.
#
#   brew install h4ux/tap/botinbox
class Botinbox < Formula
  desc "Email inboxes for AI agents, from your terminal"
  homepage "https://botinbox.dev/app/cli"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/h4ux/homebrew-tap/releases/download/cli-v0.1.0/botinbox_0.1.0_darwin_arm64.tar.gz"
      sha256 "bca8f77f98ed9c0f4f885671e97d56e27f3e97f7ce22a9b02f3243a7101ab3b4"
    end
    on_intel do
      url "https://github.com/h4ux/homebrew-tap/releases/download/cli-v0.1.0/botinbox_0.1.0_darwin_amd64.tar.gz"
      sha256 "c0ed347e0c333d219f47fe0a791a50ef2940fe770a29e96caaf9f9d91b7bdcbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ux/homebrew-tap/releases/download/cli-v0.1.0/botinbox_0.1.0_linux_arm64.tar.gz"
      sha256 "bf4c2d222357a07ae2e08d4e81616e6873cff18173193a42745e6e083faffdd0"
    end
    on_intel do
      url "https://github.com/h4ux/homebrew-tap/releases/download/cli-v0.1.0/botinbox_0.1.0_linux_amd64.tar.gz"
      sha256 "d185f3081a05cf367adb35add41acd0d2436e87cda5535e382742a5f0a762846"
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
