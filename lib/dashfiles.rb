require 'dashfiles'

module Dashfiles
  attr_accessor :config

  @config = {
    dashfiles_root_directory: File.join(Dir.home, '.dashfiles'),
    dashfiles_config_path: File.join(Dir.home, '.dashfiles', 'dashfiles.yaml')
  }

  @valid_config_keys = @config.keys

  def self.configure(options = {})
    options.each do |k, v|
      @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym
    end
  end

  def self.configure_with(config_file)
    configure(YAML.safe_load(File.open(config_file)))
  rescue Errno::ENOENT
    STDERR.puts "Couldn't find a configuration file, using defaults."
  rescue Psych::SyntaxError
    STDERR.puts 'Configuration file contains invalid syntax, using defaults.'
  end
end
