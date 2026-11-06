class FileMapper < Formula
  desc "Combines tree and cat in one CLI for recursive project mapping and file content viewing"
  homepage "https://github.com/sky93/file-mapper"
  version "0.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sky93/file-mapper/releases/download/v0.0.11/file-mapper_0.0.11_darwin_amd64.tar.gz"
      sha256 "04acca7cc3c5dabdcb3108b56b9044eb0811716923664ec12ccc9d9abecd7114"

      def install
        bin.install "file-mapper"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/sky93/file-mapper/releases/download/v0.0.11/file-mapper_0.0.11_darwin_arm64.tar.gz"
      sha256 "2de6423e5b47a09b8a00c2637d7b679957ce552bcaaf3f79b686d4c0a6eea7cc"

      def install
        bin.install "file-mapper"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/sky93/file-mapper/releases/download/v0.0.11/file-mapper_0.0.11_linux_amd64.tar.gz"
      sha256 "31948647c78f31bacd64d63c25755b194f502a75720e42696976ab96e35c5ec6"

      def install
        bin.install "file-mapper"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/sky93/file-mapper/releases/download/v0.0.11/file-mapper_0.0.11_linux_arm64.tar.gz"
      sha256 "0a760de36c2cc895ad336ab20a19eba77c1581c182751100df049006525a1b30"

      def install
        bin.install "file-mapper"
      end
    end
  end

  test do
    assert_match "0.0.11", shell_output("#{bin}/file-mapper --version")
  end
end
