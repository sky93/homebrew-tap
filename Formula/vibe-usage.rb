class VibeUsage < Formula
  desc "Local Claude Code session usage and KV-cache analyzer"
  homepage "https://github.com/sky93/vibe-usage"
  url "https://github.com/sky93/vibe-usage/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7521b837c72c5d45f7f2eac39a753f6539883377f1816c55ed0c28b6b85cfa59"
  license "MIT"
  head "https://github.com/sky93/vibe-usage.git", branch: "main"

  depends_on "node"

  def install
    libexec.install "package.json", "src", "public"
    chmod 0755, libexec/"src/cli.mjs"
    (bin/"vibe-usage").write_env_script libexec/"src/cli.mjs", PATH: "#{Formula["node"].opt_bin}:$PATH"
    (bin/"ccdash").write_env_script libexec/"src/cli.mjs", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/vibe-usage --version").strip
    assert_match "vibe-usage", shell_output("#{bin}/vibe-usage --help")
  end
end
