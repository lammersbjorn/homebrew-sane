class Sane < Formula
  desc "Terminal onboarding and setup surface for Codex"
  homepage "https://github.com/lammersbjorn/sane"
  url "https://github.com/lammersbjorn/sane/releases/download/v1.0.0-beta.10/sane-codex-1.0.0-beta.10.tgz"
  sha256 "fadadd912df1fefe9821ade5a6c5323683f024deb390a31bb6f8f2499ccd0735"
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
