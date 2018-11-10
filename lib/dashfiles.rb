require 'dashfiles'
require 'thor'

require 'dashfiles/sub_commands'

module Dashfiles
  class CLI < Thor
    map ['--version'] => :__version

    desc 'add', 'Add new dotfiles.'
    subcommand 'add', SubCommands::Add

    desc '--version', 'Print the version number.'
    def __version
      puts Dashfiles::VERSION
    end
  end
end
