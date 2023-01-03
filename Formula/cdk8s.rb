require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.94.tgz"
  sha256 "112c0b60dec330783366d34da03764c75191aa4430724f1ca72e0571437f99b7"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "ca1a689b81d424ee386918ccfeab6ab2e5e8a1ff4bf9da19d80516c55475d802"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
