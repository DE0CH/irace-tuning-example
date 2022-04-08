class Irace < Formula
    desc "Iterated Racing for Automatic Algorithm Configuration"
    homepage "http://iridia.ulb.ac.be/irace"
    url "https://cran.r-project.org/src/contrib/irace_3.4.1.tar.gz"
    sha256 "7eea92ba42e6ba320fa8bdca3c53091ae42f26a0f097244f65e7e117f6d514b6"
    license "GNU General Public License v2.0"
  
    depends_on "R"
  
    def install
      system "mkdir", "r-install"
      system "R", "CMD", "INSTALL", ".", "--library=r-install"
      bin.install "r-install/irace/bin/irace"
      bin.install "r-install/irace/bin/irace2pyimp"
      bin.install "r-install/irace/bin/parallel-irace"
      bin.install "r-install/irace/bin/parallel-irace-mpi"
      bin.install "r-install/irace/bin/parallel-irace-qsub"

    end
  
    test do
        system "#{bin}/irace"
    end
  end

  