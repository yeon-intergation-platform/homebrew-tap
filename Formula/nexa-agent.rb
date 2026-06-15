# Homebrew formula (tap 용). `brew` 가 url 의 sha256 을 **자동 검증**하므로 사용자는 수동
# 해시검증을 하지 않아도 된다. 릴리스마다 CI(agent-build.yml)가 version·sha256 을 채워
# 렌더링한 결과를 tap 저장소(yeon-intergation-platform/homebrew-tap)로 보낸다.
#
# 사용자 설치:
#   brew tap yeon-intergation-platform/tap
#   brew install nexa-agent
class NexaAgent < Formula
  desc "커뮤니티 Provider Agent — 내 PC의 로컬 Ollama 를 중앙 서버에 연결"
  homepage "https://github.com/yeon-intergation-platform/nexa-releases"
  version "0.53.5"
  license "MIT"

  on_macos do
    url "https://github.com/yeon-intergation-platform/nexa-releases/releases/download/agent-v#{version}/nexa-agent-macos"
    sha256 "138346ae871e0708a00036cf2399d4ae55cc09c5bcdb5ffe6fd3a432aa0d03b6"
  end

  on_linux do
    url "https://github.com/yeon-intergation-platform/nexa-releases/releases/download/agent-v#{version}/nexa-agent-linux"
    sha256 "b981d888c4b3629ae671e722004009361c3920679f58fae3a3c1fb14c6e767e3"
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
