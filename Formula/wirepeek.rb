class Wirepeek < Formula
  desc "High-performance network packet analyzer with modern TUI"
  homepage "https://github.com/lucientong/wirepeek"
  url "https://github.com/lucientong/wirepeek/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "8b1bebea9cee58009a7f482a393a39348bfd356a908956cc65d150d4321dd42d"
  license "Apache-2.0"
  version "0.6.0"

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
