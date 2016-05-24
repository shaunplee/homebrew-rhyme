class Rhyme < Formula
  desc "Takes a word and returns a formatted list of words that rhyme with it."
  homepage "http://rhyme.sourceforge.net"
  url "https://downloads.sourceforge.net/project/rhyme/rhyme/0.9/rhyme-0.9.tar.gz?r=&ts=1464063085"
  version "0.9"
  sha256 "11d4862cc3adfc18ea83ca233854c562fcebdc838fa7fb62de6ef3f63f992bd4"

  depends_on "gdbm"
  depends_on "readline"

  def install
    system "tar", "xf", "rhyme-0.9.tar"
    Dir.chdir("rhyme-0.9") do
      system "make", "-i", "BINPATH=#{HOMEBREW_PREFIX}/bin", "RHYMEPATH=#{HOMEBREW_PREFIX}/share/rhyme", "MANPATH=#{HOMEBREW_PREFIX}/share/man/man1"
      bin.install "rhyme"
      pkgshare.install "words.db"
      pkgshare.install "rhymes.db"
      pkgshare.install "multiple.db"
      man1.install "rhyme.1"
    end
  end

  test do
    system "#{bin}/rhyme", "busta"
  end
end
