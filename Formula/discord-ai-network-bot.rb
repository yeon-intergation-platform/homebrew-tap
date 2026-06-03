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
  version "0.17.0"
  license "MIT"

  on_macos do
    url "https://github.com/Hyeonjun0527/discord-ai-network-bot/releases/download/agent-v#{version}/discord-ai-network-bot-macos"
    sha256 "b71fa8b7e3d26248ffc3053da990f2dadf34849ecb1a58816ed091a8f01b0331"
  end

  on_linux do
    url "https://github.com/Hyeonjun0527/discord-ai-network-bot/releases/download/agent-v#{version}/discord-ai-network-bot-linux"
    sha256 "90dab808b6a66af5a4f2aff1d5190b7c52c4d91ba03f7d60c7e76baf2af4528d"
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
