# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Irace < Formula
    desc "Test"
    homepage ""
    url "https://cran.r-project.org/src/contrib/irace_3.4.1.tar.gz"
    sha256 "7eea92ba42e6ba320fa8bdca3c53091ae42f26a0f097244f65e7e117f6d514b6"
    license "MIT"
  
    depends_on "R"
  
    def install
      # ENV.deparallelize  # if your formula fails when building in parallel
      # Remove unrecognized options if warned by configure
      # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
      system "mkdir", "r-install"
      system "R", "CMD", "INSTALL", ".", "--library=r-install"
      bin.install "r-install/irace/bin/irace"
      bin.install "r-install/irace/bin/irace2pyimp"
      bin.install "r-install/irace/bin/parallel-irace"
      bin.install "r-install/irace/bin/parallel-irace-mpi"
      bin.install "r-install/irace/bin/parallel-irace-qsub"

      # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    end
  
    test do
        system "#{bin}/irace"
    end
  end

  