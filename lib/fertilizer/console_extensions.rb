# Following module allows us to call following IRB commands:
#
# * reload_lib  - reloads whole lib folder meaning you don't have to restart irb
# * cls         - clears IRB console
# * code        - displays source code for method with given instance/class

module ConsoleExtensions

  # Reload lib configuration from console
  def reload_lib
    path = File.join( Rails.root, 'lib') 
    failures = []
    Dir.glob("#{path}/**/*.rb").each {  |file|
      puts "loading: #{file.inspect} ... "
      begin
        if !(file.include? 'reload.rb')
          load file
        end
      rescue => ex
        failures << file 
      end
    }
     
    # this second pass is here to try to catch anything that 
    # is dependent on something else
    # could be improved, but is working fine for my needs
    double_failures = []
    for file in failures 
      begin
        # don't reload yourself
        if !(file.include? 'reload.rb')
          load file
        end
      rescue => ex1
        double_failures << file 
      end
    end 

    if double_failures.size > 0 
      puts "these files failed twice"
      for file in double_failures
        puts file
      end
    end
  end

  def cls
    is_windows?
      system('cls')
    is_mac? || is_linux?
      system('clear')
    return nil
  end

  # Takes instance/class, method and displays source code and comments
  def code(ints_or_clazz, method)
    method = method.to_sym
    clazz = ints_or_clazz.is_a?(Class) ? ints_or_clazz : ints_or_clazz.class
    puts "** Comments: "
    clazz.instance_method(method).comment.display
    puts "** Source:"
    clazz.instance_method(method).source.display
  end

  # Prints SQL log on console
  def log_sql
    if ActiveRecord::Base.logger = Logger.new(STDOUT)
      return 'Console will output SQL logs'
    else
      return 'Something went wrong!!!'
    end
  end

  private

  # methods to determine on what OS are user
  def is_mac?
    RUBY_PLATFORM.downcase.include?("darwin")
  end

  def is_windows?
    RUBY_PLATFORM.downcase.include?("mswin")
  end

  def is_linux?
    RUBY_PLATFORM.downcase.include?("linux")
  end
end