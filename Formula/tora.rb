class Tora < Formula
  desc "TORA (Tex One-shot Report Agent) - AI-powered LaTeX report generator"
  homepage "https://github.com/TEIKOTA/tora"
  url "https://github.com/TEIKOTA/tora/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "d6b2204a4a98edaba91c575ebaaf02b2afcfa238ee7de64fb6519f94dda589a7"
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
