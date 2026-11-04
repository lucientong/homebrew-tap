cask "gimme-remote" do
  version "0.2.0"
  sha256 "bff92146b5fec3821c730138e10c6eca8eb7c277d9fe994d595621a3da21fb16"

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
