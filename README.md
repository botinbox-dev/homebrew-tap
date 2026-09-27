<p align="center">
  <a href="https://botinbox.dev"><img src="https://botinbox.dev/brand/botinbox-icon-192.png" width="96" height="96" alt="BotInbox"></a>
</p>

<h1 align="center">BotInbox CLI</h1>

<p align="center">
  <strong>Email inboxes for AI agents, from your terminal.</strong><br>
  Create inboxes, send and read mail, stream events, and grab verification codes in CI.
</p>

<p align="center">
  <a href="https://botinbox.dev">Website</a> ·
  <a href="https://botinbox.dev/app/docs">Docs</a> ·
  <a href="https://botinbox.dev/app/cli">Downloads</a> ·
  <a href="https://botinbox.dev/app/docs/integrations/mcp">MCP</a>
</p>

---

## Install

**macOS and Linux (Homebrew)**

```sh
brew install botinbox-dev/tap/botinbox
```

**macOS and Linux (install script)**: downloads the right binary and verifies its SHA-256 checksum:

```sh
curl -fsSL https://botinbox.dev/install.sh | sh
```

**Windows (PowerShell)**

```powershell
irm https://botinbox.dev/install.ps1 | iex
```

**Direct downloads** for macOS, Linux and Windows (arm64 and x86_64) are on the
[downloads page](https://botinbox.dev/app/cli) and in this repo's [Releases](../../releases),
with a `SHA256SUMS` file for verification.

## Quick start

```sh
botinbox login                                   # paste an API key from the dashboard
botinbox inboxes create --username scout         # scout@mail.botinbox.dev
botinbox send --from scout@mail.botinbox.dev \
  --to you@example.com --subject "Hello" --text "Sent by my agent"
botinbox messages ls scout@mail.botinbox.dev --unread
```

### Wait for a verification code (CI and E2E tests)

```sh
CODE=$(botinbox wait --inbox signup-bot@mail.botinbox.dev \
  --from noreply@yourapp.com --subject-contains verify \
  --since 2m --timeout 90s --code)
```

### Stream live events

```sh
botinbox tail --inbox scout@mail.botinbox.dev
```

### Connect an AI agent over MCP

```sh
botinbox mcp --client claude-code   # prints a ready-to-paste setup for Claude Code, Claude Desktop or Cursor
```

Every command supports `--json` for scripting, and `botinbox completion` generates shell completions
(Homebrew installs them automatically).

## Commands

| Area | Commands |
|---|---|
| Mail | `inboxes`, `send`, `messages`, `threads`, `drafts`, `labels`, `rules`, `tail`, `wait` |
| Account | `domains`, `keys`, `pods`, `webhooks`, `usage`, `whoami` |
| Setup | `login`, `logout`, `config`, `mcp`, `completion`, `version` |

Full reference: [botinbox.dev/app/docs/integrations/cli](https://botinbox.dev/app/docs/integrations/cli)

## Upgrade and uninstall

```sh
brew upgrade botinbox          # Homebrew
brew uninstall botinbox
```

With the install script, re-run it to upgrade. Remove the binary from `/usr/local/bin` or
`~/.local/bin` to uninstall. Stored credentials live in your OS config directory under `botinbox/`.

## Support and security

- Help: [hello@botinbox.dev](mailto:hello@botinbox.dev) · [Documentation](https://botinbox.dev/app/docs)
- Security reports: [security@botinbox.dev](mailto:security@botinbox.dev)
- Abuse reports: [abuse@botinbox.dev](mailto:abuse@botinbox.dev)

---

This repository hosts the Homebrew formula and release binaries for the BotInbox CLI.
Use of BotInbox is subject to the [Terms of Service](https://botinbox.dev/legal/terms).
© Nolatech Ltd.
