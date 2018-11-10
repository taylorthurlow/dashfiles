require 'dashfiles'
require 'thor'

module Dashfiles
  class CLI < Thor
    map ['--version'] => :__version

    desc 'add FILE', 'Add a new dotfile.'
    long_desc <<~LONGDESC
      `dashfiles add [file]` will take an existing, unlinked dotfile from your
      filesystem, move it into your dashfiles directory, and symlink it back
      into its original location.
    LONGDESC
    def add(path)
      puts "Added from path: #{path}."
    end

    desc '--version', 'Print the version number.'
    def __version
      puts Dashfiles::VERSION
    end
  end
end
