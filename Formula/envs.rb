class Envs < Formula
  desc "Sync encrypted development secrets through a private git repository"
  homepage "https://github.com/lminii/envs"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lminii/envs/releases/download/v0.2.0/envs-darwin-arm64"
      sha256 "c31c4413b8e7f50485cc5d82716c019e4a1e720829ea09bdf931d0d3b5985c50"
    end
    on_intel do
      url "https://github.com/lminii/envs/releases/download/v0.2.0/envs-darwin-amd64"
      sha256 "bbe383f39b453258dbb380f7b85cee9dc1af75ce66f73ca5db45d2d1fd7e2f25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lminii/envs/releases/download/v0.2.0/envs-linux-arm64"
      sha256 "77f8f1e581b2ba86ece7e7bfe2d1401f55ca0c2aea38106d6299ed19b0efd1d1"
    end
    on_intel do
      url "https://github.com/lminii/envs/releases/download/v0.2.0/envs-linux-amd64"
      sha256 "174430a648761a4a7cc92c5dc341fd59e171562005d4e24ec173d54da82fa332"
    end
  end

  uses_from_macos "git"

  def install
    bin.install Dir["envs-*"].first => "envs"
  end

  test do
    assert_match "envs syncs encrypted development secrets", shell_output("#{bin}/envs help")
  end
end
