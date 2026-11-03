cask "gimme-remote" do
  version "0.1.1"
  sha256 "d332802877e37b7ac0df27b3776ea23b980446fd80e4f91da0ea7dd1f2aba7f6"

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
