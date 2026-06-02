# Homebrew formula (tap 용). `brew` 가 url 의 sha256 을 **자동 검증**하므로 사용자는 수동
# 해시검증을 하지 않아도 된다. 릴리스마다 CI(agent-build.yml)가 version·sha256 을 채워
# 렌더링한 결과를 tap 저장소(yeon-intergation-platform/homebrew-tap)로 보낸다.
#
# 사용자 설치:
#   brew tap yeon-intergation-platform/tap
#   brew install discord-ai-agent-network-bot
class DiscordAiAgentNetworkBot < Formula
  desc "커뮤니티 Provider Agent — 내 PC의 로컬 Ollama 를 중앙 서버에 연결"
  homepage "https://github.com/Hyeonjun0527/discord-assistant"
  version "0.2.1"
  license "MIT"

  on_macos do
    url "https://github.com/Hyeonjun0527/discord-assistant/releases/download/agent-v#{version}/discord-ai-agent-network-bot-macos"
    sha256 "9a934dab42279dd60067f47edc73c3b73b2fb566d05eb0fec9d862afdafbe29a"
  end

  on_linux do
    url "https://github.com/Hyeonjun0527/discord-assistant/releases/download/agent-v#{version}/discord-ai-agent-network-bot-linux"
    sha256 "cb2413eea7e3758d089d9e1043a7e15e1dee47aa2e442aebb854a1841ef1df56"
  end

  def install
    # 단일 실행파일을 표준 이름으로 설치(일반 사용자 prefix, 관리자 불필요).
    binary = Dir["discord-ai-agent-network-bot-*"].first
    bin.install binary => "discord-ai-agent-network-bot"
  end

  test do
    assert_match "discord-ai-agent-network-bot", shell_output("#{bin}/discord-ai-agent-network-bot --version")
  end
end
