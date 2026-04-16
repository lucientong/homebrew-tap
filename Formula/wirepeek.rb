class Wirepeek < Formula
  desc "High-performance network packet analyzer with modern TUI"
  homepage "https://github.com/lucientong/wirepeek"
  url "https://github.com/lucientong/wirepeek/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "d081e0d4f05e07a9bb81c2587dfcb1ad348427cdc8497600c939518b2897b033"
  license "Apache-2.0"
  version "0.4.0"

  depends_on "cmake" => :build
  depends_on "libpcap"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
           "-DCMAKE_BUILD_TYPE=Release", "-DBUILD_TESTING=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "wirepeek", shell_output("#{bin}/wirepeek --help")
  end
end
