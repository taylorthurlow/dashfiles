require 'thor'

module Dashfiles
  class CLI < Thor
    class_option :verbose, type: :boolean

    desc 'add FILE', 'Add a new dotfile.'
    long_desc <<~LONGDESC
      `dashfiles add [file]` will take an existing, unlinked dotfile from your
      filesystem, move it into your dashfiles directory, and symlink it back
      into its original location.
    LONGDESC
    def add(path)
      if File.directory?(path)
        Dotfiles.create_directory(
          path: path,
          copy: false,
          verbose: options[:verbose]
        )
      elsif File.file?(path)
        Dotfiles.create(path: path, copy: false, verbose: options[:verbose])
      end
    end

    map ['--version'] => :__version
    desc '--version', 'Print the version number.'
    def __version
      puts Dashfiles::VERSION
    end
  end
end
