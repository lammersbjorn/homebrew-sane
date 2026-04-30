class Sane < Formula
  desc "Terminal onboarding and setup surface for Codex"
  homepage "https://github.com/lammersbjorn/sane"
  url "https://github.com/lammersbjorn/sane/releases/download/v1.0.0-beta.5/sane-codex-1.0.0-beta.5.tgz"
  sha256 "60efadb6ab698ef331869f4f195eed3671f9923746ddee2f4ee1e46aca371b7a"
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
