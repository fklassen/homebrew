require "formula"

class Mruby < Formula
  homepage "http://www.mruby.org"
  url "https://github.com/mruby/mruby/archive/1.0.0.zip"
  sha1 "48861f5e01019fd82da4543c01d163fc03ec4643"

  head "https://github.com/mruby/mruby.git"

  depends_on "bison" => :build

  def install
    system "make"

    cd "build/host/" do
      lib.install Dir["lib/*.a"]
      prefix.install %w{bin mrbgems mrblib tools}
    end
  end

  test do
    system "#{bin}/mruby", "-e", "true"
  end
end