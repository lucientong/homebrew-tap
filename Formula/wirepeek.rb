class Wirepeek < Formula
  desc "High-performance network packet analyzer with modern TUI"
  homepage "https://github.com/lucientong/wirepeek"
  url "https://github.com/lucientong/wirepeek/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "1569e1b642b24b28770520e32e96f8da4c3d8f2a49dfae31a2092f256beac6cd"
  license "Apache-2.0"
  version "1.1.0"

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
