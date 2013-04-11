require 'formula'

class Torch7 < Formula
  homepage 'http://www.torch.ch/'
  head 'https://github.com/andresy/torch.git'
  url 'https://github.com/andresy/torch/archive/7.0.3-0.zip'
  version '7.0.3-0'
  sha1 'd455003b3f632ffd5062f98de774479c1de57607'

  depends_on 'cmake' => :build
  depends_on 'homebrew/versions/gcc48' => :build
  depends_on 'readline'
  depends_on 'gnuplot'
  depends_on 'qt'
  depends_on 'homebrew/science/openblas'

  def install
    ENV['CC'] = 'gcc-4.8'
    ENV['CXX'] = 'g++-4.8'
    mkdir 'build' do
      system 'cmake', '..', *std_cmake_args
      system 'make install'
    end
  end

  test do
    system 'torch -h'
  end
end
