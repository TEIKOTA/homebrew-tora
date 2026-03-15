class Tora < Formula
  desc "TORA (Tex One-shot Report Agent) - AI-powered LaTeX report generator"
  homepage "https://github.com/[あなたのGitHubユーザー名]/tora"
  url "https://github.com/[あなたのGitHubユーザー名]/tora/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "[ここは後で埋めます]"
  license "MIT"

  # 依存関係
  depends_on "node"
  # Gemini CLI は npm なので依存には入れませんが、インストールされている必要があります。

  def install
    # 実行スクリプトのインストール
    bin.install "tora"
    
    # エージェント定義ファイルをすべて share ディレクトリに保存
    (share/"tora/.gemini/agents").install Dir[".gemini/agents/*.md"]
  end

  test do
    # インストール後のテスト
    system "#{bin}/tora", "init"
    assert_predicate testpath/".gemini/agents/tora.md", :exist?
    assert_predicate testpath/".gemini/agents/tora-researcher.md", :exist?
  end
end
