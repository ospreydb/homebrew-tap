class Osprey < Formula
  desc "1-bit RaBitQ vector search engine and server for S3 and object storage"
  homepage "https://ospreydb.ramoslucas-lr.workers.dev"
  version "0.1.2"
  license "Apache-2.0"

  head do
    url "https://github.com/ospreydb/ospreydb.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/ospreydb/ospreydb/releases/download/v0.1.2/osprey-0.1.2-aarch64-apple-darwin.tar.gz"
      # Updated automatically by .github/workflows/release.yml on tagged releases
      sha256 "d7d68fa1d7454c4270057ed1141f52a78da12a02d9461e5b0a57ab4c4e86c450"
    end

    on_intel do
      url "https://github.com/ospreydb/ospreydb/releases/download/v0.1.2/osprey-0.1.2-x86_64-apple-darwin.tar.gz"
      # Updated automatically by .github/workflows/release.yml on tagged releases
      sha256 "c3d73726f12be2696fc9f269c1d881102114002874432ce8614154157eb3be47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ospreydb/ospreydb/releases/download/v0.1.2/osprey-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      # Updated automatically by .github/workflows/release.yml on tagged releases
      sha256 "cb618890c52c11f91c3621abd7600b017af677e61522aca63ccd0d6ae81c5542"
    end

    on_intel do
      url "https://github.com/ospreydb/ospreydb/releases/download/v0.1.2/osprey-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      # Updated automatically by .github/workflows/release.yml on tagged releases
      sha256 "caf770c1cb5a929360448dfd895b913e19a33a2a28a3eb34edfe05ae544c8f0a"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args(path: "crates/ospreydb")
    else
      bin.install "osprey"
    end
  end

  def caveats
    <<~EOS
      Start the local OspreyDB server:
        osprey serve --data-dir ./data --s3-uri file://$(pwd)/s3

      Or inspect diagnostics and CLI subcommands:
        osprey doctor
        osprey --help
    EOS
  end

  test do
    assert_match "osprey", shell_output("#{bin}/osprey --version")
    help_output = shell_output("#{bin}/osprey --help")
    assert_match "serve", help_output
    assert_match "doctor", help_output
    assert_match "bench", help_output
  end
end
