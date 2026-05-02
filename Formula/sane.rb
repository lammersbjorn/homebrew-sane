class Sane < Formula
  desc "Terminal onboarding and setup surface for Codex"
  homepage "https://github.com/lammersbjorn/sane"
  url "https://github.com/lammersbjorn/sane/releases/download/v1.0.0-beta.9/sane-codex-1.0.0-beta.9.tgz"
  sha256 "49ac02744f0eb8edc509dae1d7bf127c912e243d02b61c518e78d700bf3b7957"
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
