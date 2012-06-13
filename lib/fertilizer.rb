require "fertilizer/version"

module Fertilizer

  if defined?(Rails::Console)
    # <-- CONSOLE EXTENSION (CONSOLE ONLY)-->
    # Following part of code is active with the start of IRB console. 
    # Details about features can be seen in console_extensions module.

    require 'fertilizer/console_extensions'
    include ConsoleExtensions

    # <-- OBJECT EXTENSIONS (CONSOLE ONLY)-->
    require 'fertilizer/object_extensions'

      # add it to the scope
    Kernel.send(:include,self)
    Object.send(:include,Kernel)
  end


end
