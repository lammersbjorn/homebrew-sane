class Sane < Formula
  desc "Terminal onboarding and setup surface for Codex"
  homepage "https://github.com/lammersbjorn/sane"
  url "https://github.com/lammersbjorn/sane/releases/download/v1.0.0-beta.8/sane-codex-1.0.0-beta.8.tgz"
  sha256 "b9800fb1b05b19e60e49d39d132d4048a7be7a6439b428ec5e74e1a0e7ecf8a2"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "node@22"
  depends_on "rtk"

  def install
    libexec.install Dir["*"]
    (bin/"sane").write <<~SH
      #!/bin/sh
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/bin/sane.js" "$@"
    SH
  end

  test do
    assert_match "Sane", shell_output("#{bin}/sane status")
  end
end
