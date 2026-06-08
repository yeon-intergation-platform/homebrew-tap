# Homebrew formula (tap 용). `brew` 가 url 의 sha256 을 **자동 검증**하므로 사용자는 수동
# 해시검증을 하지 않아도 된다. 릴리스마다 CI(agent-build.yml)가 version·sha256 을 채워
# 렌더링한 결과를 tap 저장소(yeon-intergation-platform/homebrew-tap)로 보낸다.
#
# 사용자 설치:
#   brew tap yeon-intergation-platform/tap
#   brew install nexa-agent
class NexaAgent < Formula
  desc "커뮤니티 Provider Agent — 내 PC의 로컬 Ollama 를 중앙 서버에 연결"
  homepage "https://github.com/Hyeonjun0527/discord-ai-network-bot"
  version "0.36.5"
  license "MIT"

  on_macos do
    url "https://github.com/Hyeonjun0527/discord-ai-network-bot/releases/download/agent-v#{version}/nexa-agent-macos"
    sha256 "744f7b3d73f0344b4bc85b517bee207696d1ec22c7624573a2730c230be3bbf0"
  end

  on_linux do
    url "https://github.com/Hyeonjun0527/discord-ai-network-bot/releases/download/agent-v#{version}/nexa-agent-linux"
    sha256 "3762588a02e0d9be384bc2971f855ee185d3c96ee4bc683abe4313b818d64b4c"
  end

  def install
    # 단일 실행파일을 표준 이름으로 설치(일반 사용자 prefix, 관리자 불필요).
    binary = Dir["nexa-agent-*"].first
    bin.install binary => "nexa"
  end

  test do
    assert_match "nexa", shell_output("#{bin}/nexa --version")
  end
end
