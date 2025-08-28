# typed: false
# frozen_string_literal: true

class PullApk < Formula
  desc "Pull and optionally decompile/view Android APKs from a connected device"
  homepage "https://github.com/Yeboahmedia/pull_android_apks"
  url "https://github.com/Yeboahmedia/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6e27cea87522659d8642d9667ef6b34e47c2d88b5b94aae10eb08d4bdb792d1a"
  license "MIT"
  version "0.1.0"


  # We deliberately do NOT declare dependencies on adb/apktool/jadx.
  # Users can install them however they prefer.

  def install
    bin.install "bin/pull-apk"
  end

  def caveats
    <<~EOS
      This tool requires:
        - adb (Android platform tools)
        - apktool (only if you use --decompile)
        - jadx-gui (only if you use --jadx)

      The formula does not install these. Install them by any means you prefer.
      You can verify presence without running an operation:
        pull-apk --check-deps
    EOS
  end

  test do
    # Ensure the CLI is present and shows usage / help without a device.
    output = shell_output("#{bin}/pull-apk 2>&1", 1)
    assert_match "Usage: pull_apk", output
    # Version prints without error
    assert_match "pull_apk 0.1.0", shell_output("#{bin}/pull-apk --version")
  end
end
