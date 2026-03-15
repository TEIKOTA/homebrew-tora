class Tora < Formula
  desc "TORA (Tex One-shot Report Agent) - AI-powered LaTeX report generator"
  homepage "https://github.com/TEIKOTA/tora"
  url "https://github.com/TEIKOTA/tora/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7deb8299d7903d36566f58bfeaed6a435ed355e690ceca65f6c90d0eb3ca37c1"
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
