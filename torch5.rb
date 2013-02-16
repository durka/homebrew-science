require 'formula'

class Torch5 < Formula
  homepage 'http://torch5.sourceforge.net/'
  url 'http://sourceforge.net/projects/torch5/files/torch5/0.8.0/Torch5-0.8.0-Source.tar.gz'
  head 'https://torch5.svn.sourceforge.net/svnroot/torch5/trunk'
  sha1 '1339ffc9e8c39de289ba69e77efea5848e1baaa1'

  conflicts_with 'lua',
    :because => 'lua and torch5 install the same binaries.'
  conflicts_with 'luajit',
    :because => 'lua and torch5 install the same binaries.'

  depends_on 'cmake' => :build
  depends_on 'qt' => :recommended
  depends_on :x11
  # Torch claims to depend on readline
  # but it really wants libedit (provided by OSX)
  # hence no depends_on 'readline'

  def install
      mkdir 'build'
      cd 'build' do
          system 'cmake', '..', *std_cmake_args
          system 'make'
          system 'make install'
      end
  end

  def test
    system 'lua -l torch -v'
  end
end

