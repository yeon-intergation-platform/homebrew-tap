# Homebrew formula (tap 용). `brew` 가 url 의 sha256 을 **자동 검증**하므로 사용자는 수동
# 해시검증을 하지 않아도 된다. 릴리스마다 CI(agent-build.yml)가 version·sha256 을 채워
# 렌더링한 결과를 tap 저장소(yeon-intergation-platform/homebrew-tap)로 보낸다.
#
# 사용자 설치:
#   brew tap yeon-intergation-platform/tap
#   brew install discord-ai-network-bot
class DiscordAiNetworkBot < Formula
  desc "커뮤니티 Provider Agent — 내 PC의 로컬 Ollama 를 중앙 서버에 연결"
  homepage "https://github.com/Hyeonjun0527/discord-ai-network-bot"
  version "0.25.3"
  license "MIT"

  on_macos do
    url "https://github.com/Hyeonjun0527/discord-ai-network-bot/releases/download/agent-v#{version}/discord-ai-network-bot-macos"
    sha256 "51ea0142807ae3ea7b52998e1061f2ae797c1f2f2f56845b41b3395902f75e0b"
  end

  on_linux do
    url "https://github.com/Hyeonjun0527/discord-ai-network-bot/releases/download/agent-v#{version}/discord-ai-network-bot-linux"
    sha256 "e36f1fc6428d0f54de9bdf0c0478e86bda215a5d73e0b41faed05375d543aaae"
  end

  def install
    # 단일 실행파일을 표준 이름으로 설치(일반 사용자 prefix, 관리자 불필요).
    binary = Dir["discord-ai-network-bot-*"].first
    bin.install binary => "discord-ai-network-bot"
  end

  test do
    assert_match "discord-ai-network-bot", shell_output("#{bin}/discord-ai-network-bot --version")
  end
end
