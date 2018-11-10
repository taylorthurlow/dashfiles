module SubCommands
  class Add < Thor
    desc 'something', 'something'
    def add
      puts 'Added something.'
    end
  end
end
