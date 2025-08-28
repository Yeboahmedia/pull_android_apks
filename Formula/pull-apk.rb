# typed: false
# frozen_string_literal: true

class PullApk < Formula
  desc "Pull and optionally decompile/view Android APKs from a connected device"
  homepage "https://github.com/Yeboahmedia/pull_android_apks"
  url "https://github.com/Yeboahmedia/pull_android_apks/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"
  version "0.2.0"

  def install
    bin.install "bin/pull-apk"
    bash_completion.install "completions/bash/pull-apk"
    zsh_completion.install  "completions/zsh/_pull-apk"
    fish_completion.install "completions/fish/pull-apk.fish"
  end

  def caveats
    <<~EOS
      Requires:
        - adb (Android platform tools)
        - apktool (only if you use --decompile)
        - jadx-gui (only if you use --jadx)

      Verify presence:
        pull-apk --check-deps
    EOS
  end

  test do
    output = shell_output("#{bin}/pull-apk 2>&1", 1)
    assert_match "Usage: pull_apk", output
    assert_match "pull_apk 0.1.0", shell_output("#{bin}/pull-apk --version")
  end
end