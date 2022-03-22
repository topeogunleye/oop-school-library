require './menu'

def run
  menu
  option = gets.chomp.to_i
  if option.positive? && option < 9
    @menu_hash[option].call
  else
    puts 'Invalid input'
    run
  end
end
