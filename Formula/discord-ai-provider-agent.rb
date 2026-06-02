# Homebrew formula (tap 용). `brew` 가 url 의 sha256 을 **자동 검증**하므로 사용자는 수동
# 해시검증을 하지 않아도 된다. 릴리스마다 CI(agent-build.yml)가 version·sha256 을 채워
# 렌더링한 결과를 tap 저장소(homebrew-tap)로 보낸다.
#
# 사용자 설치:
#   brew tap Hyeonjun0527/tap
#   brew install discord-ai-provider-agent
class DiscordAiProviderAgent < Formula
  desc "커뮤니티 Provider Agent — 내 PC의 로컬 Ollama 를 중앙 서버에 연결"
  homepage "https://github.com/Hyeonjun0527/discord-assistant"
  version "0.1.2"
  license "MIT"

  on_macos do
    url "https://github.com/Hyeonjun0527/discord-assistant/releases/download/agent-v#{version}/discord-ai-provider-agent-macos"
    sha256 "a73a16ffab8e0bd12dca1f559ec622e3b147fcc1e6f6312d754519fcfac33ec8"
  end

  on_linux do
    url "https://github.com/Hyeonjun0527/discord-assistant/releases/download/agent-v#{version}/discord-ai-provider-agent-linux"
    sha256 "fe2aa9da63cb274bf795846fffeb77bdc8b81195992c982f82e28b05c3cd5ca7"
  end

  def install
    # 단일 실행파일을 표준 이름으로 설치(일반 사용자 prefix, 관리자 불필요).
    binary = Dir["discord-ai-provider-agent-*"].first
    bin.install binary => "discord-ai-provider-agent"
  end

  test do
    assert_match "discord-ai-provider-agent", shell_output("#{bin}/discord-ai-provider-agent --version")
  end
end
