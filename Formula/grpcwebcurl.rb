class Grpcwebcurl < Formula
  desc "Command-line tool for testing gRPC-Web endpoints"
  homepage "https://github.com/hjames9/grpcwebcurl"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hjames9/grpcwebcurl/releases/download/v0.2.1/grpcwebcurl-v0.2.1-darwin-arm64"
      sha256 "61b8653cb2e889100807e63d62574c1622f1e421998d1d4dae8b0a77ec17e961"
    else
      url "https://github.com/hjames9/grpcwebcurl/releases/download/v0.2.1/grpcwebcurl-v0.2.1-darwin-amd64"
      sha256 "3ccacd13b189efc6261351784d0e66fe8b64931db766843abd0fd76840fe5c90"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "grpcwebcurl-v#{version}-darwin-arm64" => "grpcwebcurl"
    else
      bin.install "grpcwebcurl-v#{version}-darwin-amd64" => "grpcwebcurl"
    end

    # Generate shell completions
    generate_completions_from_executable(bin/"grpcwebcurl", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grpcwebcurl --version")
  end
end
