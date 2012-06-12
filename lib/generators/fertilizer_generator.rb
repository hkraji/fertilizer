require 'rails/generators'

class AriGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

=begin
  argument :generator_option, :type => :string, :default => "all" 
                          
  def self.source_root
    @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'initializers/'))
  end

  def create
    template 'ferilizier_console.rb', File.join('config', 'initializers', 'ferilizier_console.rb')
  end
=end


end