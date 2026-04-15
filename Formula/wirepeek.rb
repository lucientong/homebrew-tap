class Wirepeek < Formula
  desc "High-performance network packet analyzer with modern TUI"
  homepage "https://github.com/lucientong/wirepeek"
  url "https://github.com/lucientong/wirepeek/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "6c10449a191026be07fa4e6c62e96dfbb5f5d1747415cdf1702f419a0e51a43f"
  license "Apache-2.0"
  version "0.1.4"

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
