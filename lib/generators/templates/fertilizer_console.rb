# Following part of code is active with the start of IRB console. 
# Details about features can be seen in console_extensions module.

if defined?(Rails::Console)
    require 'fertilizer/console_extensions'
    include ConsoleExtensions

    # include all modules from lib/poc folder
    Dir.chdir('lib') do
        Dir["poc/*.rb"].each do |file| 
            require file
            eval "include  #{File.basename(file).gsub(/\.rb/,'').camelize}"
        end
    end

end

