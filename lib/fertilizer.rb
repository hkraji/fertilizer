require "fertilizer/version"

module Fertilizer

  # <-- CONSOLE EXTENSION (CONSOLE ONLY)-->
  # Following part of code is active with the start of IRB console. 
  # Details about features can be seen in console_extensions module.

  if defined?(Rails::Console)
    require 'fertilizer/console_extensions'
    include ConsoleExtensions
  end


 
  # <-- OBJECT EXTENSIONS (CONSOLE ONLY)-->
  if defined?(Rails::Console)
    require 'fertilizer/object_extensions'
  end

  # add it to the scope
  Object.send(:include,self)

end
