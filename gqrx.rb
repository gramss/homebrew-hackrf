class Gqrx < Formula
  homepage 'https://github.com/csete/gqrx'
  head 'https://github.com/csete/gqrx.git', :branch => 'master'

  depends_on 'cmake' => :build
  depends_on 'qt@5'
  #depends_on 'boost'
  depends_on 'gnuradio'
  depends_on 'gramss/sdr/gr-osmosdr'

  def install
    mkdir "build" do
      ENV.append "CXXFLAGS", "-02"
      #system "export CXXFLAGS=-O2"
      
      system "cmake", "..",
      system "make"
      bin.install 'gqrx.app/Contents/MacOS/gqrx'
      
    end
      
      
      
    #system "qmake -set PKG_CONFIG /usr/local/bin/pkg-config"
    #system "qmake -query"
    #system "qmake gqrx.pro"
    #system "make"
    #bin.install 'gqrx.app/Contents/MacOS/gqrx'
  end
end
