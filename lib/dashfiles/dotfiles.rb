require 'pry'

module Dashfiles
  class Dotfiles
    def self.create(path:, copy: false, verbose: false)
      puts "#{copy ? 'Copied' : 'Linked'} #{path}" if verbose
    end

    def self.create_directory(path:, copy: false, verbose: false)
      # get all files recursively, including hidden files
      Dir.glob("#{path}/**/*", File::FNM_DOTMATCH).each do |file|
        next if File.directory?(file)

        if File.symlink?(file)
          puts "Skipped symlink #{file}" if verbose
          next
        end

        create(path: file, copy: copy, verbose: verbose)
      end
    end
  end
end
