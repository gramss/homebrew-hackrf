class Gqrx < Formula
  homepage 'https://github.com/csete/gqrx'
  head 'https://github.com/csete/gqrx.git', :branch => 'master'

  depends_on 'cmake' => :build
  depends_on 'qt@5'
  depends_on 'gnuradio'
  depends_on 'gramss/sdr/gr-osmosdr'

  def install
    mkdir "build" do      
      args = %W[
        -DCMAKE_SHARED_LINKER_FLAGS='-Wl,-undefined,dynamic_lookup'
        -DQt5_DIR='#{HOMEBREW_PREFIX}/lib/cmake/Qt5'
        -DPYTHON_LIBRARY='#{HOMEBREW_PREFIX}/lib/libgnuradio-runtime.dylib'
      ] + std_cmake_args
      
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
