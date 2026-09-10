class Wirepeek < Formula
  desc "High-performance network packet analyzer with modern TUI"
  homepage "https://github.com/lucientong/wirepeek"
  url "https://github.com/lucientong/wirepeek/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "3bd414329ef3d07f1161d25525a2c83260abf32a1e0edc37d760959a38a21609"
  license "Apache-2.0"
  version "1.2.0"

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
