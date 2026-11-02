cask "gimme-remote" do
  version "0.1.0"
  sha256 "b612c34a453aa732c0c8cd505dfc029bc43042abcd78299cb677c567bda3ba0f"

  url "https://github.com/lucientong/gimme-remote/releases/download/v#{version}/GimmeRemote-#{version}-universal.zip"
  name "Gimme Remote"
  desc "Control your Mac from your phone on the local network"
  homepage "https://github.com/lucientong/gimme-remote"

  depends_on macos: ">= :sonoma"

  app "GimmeRemote.app"
  binary "#{appdir}/GimmeRemote.app/Contents/MacOS/gimme"

  uninstall quit: "com.lucientong.GimmeRemote"

  zap trash: [
    "~/Library/Application Support/GimmeRemote",
    "~/Library/Preferences/com.lucientong.GimmeRemote.plist",
  ]

  caveats <<~EOS
    GimmeRemote is signed without an Apple Developer ID and is not notarized by Apple.
    If macOS blocks the first launch, open System Settings > Privacy & Security > Open Anyway.
    Grant Accessibility permission for remote input. If input stops working after an update,
    remove GimmeRemote from Privacy & Security > Accessibility with "-", then add it again.
  EOS
end
