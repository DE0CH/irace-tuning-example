class Irace < Formula
  desc "Iterated Racing for Automatic Algorithm Configuration"
  homepage "http://iridia.ulb.ac.be/irace"
  url "https://cran.r-project.org/src/contrib/irace_3.4.1.tar.gz"
  sha256 "7eea92ba42e6ba320fa8bdca3c53091ae42f26a0f097244f65e7e117f6d514b6"
  license "GNU General Public License v2.0"

  depends_on "r"

  resource "R6" do 
    url "https://cran.r-project.org/src/contrib/R6_2.5.1.tar.gz"
    sha256 "8d92bd29c2ed7bf15f2778618ffe4a95556193d21d8431a7f75e7e5fc102bf48"
  end

  def install
    ENV.deparallelize

    system "mkdir", "#{buildpath}/r-lib"
    resource("R6").stage do
      system "R", "CMD", "INSTALL", ".", "--library=#{buildpath}/r-lib"
    end
    system "R", "CMD", "INSTALL", ".", "--library=#{buildpath}/r-lib"
    # bin.install Dir["#{buildpath}/r-lib/irace/bin"]
    prefix.install Dir["#{buildpath}/r-lib/"]
    bin.install "#{prefix}/r-lib/irace/bin/irace"
    bin.install "#{prefix}/r-lib/irace/bin/irace2pyimp"
    bin.install "#{prefix}/r-lib/irace/bin/parallel-irace"
    bin.install "#{prefix}/r-lib/irace/bin/parallel-irace-mpi"
    bin.install "#{prefix}/r-lib/irace/bin/parallel-irace-qsub"


  end

  test do
      system "R_LIBS=#{opt_prefix}/r-lib #{bin}/irace"
  end

  def caveats
    <<~EOS
      You need to let R know the installation of the irace package by setting an environment variable
        $ export R_LIBS="#{opt_prefix}/r-lib"
    EOS
  end
end

  