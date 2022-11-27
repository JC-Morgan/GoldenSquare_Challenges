require_relative './send_message.rb'

class TakeOrders

  def initialize(sender) #sender is an instance of SendMessage
    @menu = [["Margherita Pizza", 13], ["Vegetarian Pizza", 16.5], ["Pepperoni Pizza", 16.9], ["Lasagne", 12.3], ["Mushroom Risotto", 13.4],
     ["Seafood Linguine", 16.5], ["Garlic Bread", 5.5], ["Tiramisu", 8], ["Cannoli", 6.2], ["Panna Cotta", 6.7]]
    @order = []
    @sender = sender
  end

  def display_menu
    puts "-----"
    puts "MENU:"
    puts "-----"
    puts "[0] See Order"
    @menu.each_with_index do |item, index|
      puts "[#{index+1}] #{item.first} - £#{item.last}"
    end
  end

  def find_total
    @total = 0
    @order.each do |name, price|
      @total += price
    end
  end

  def make_selection
    display_menu
    puts "Type in the number of your selection: (any invalid input will default to 0)"
    selection = gets.chomp.to_i
    selection = 0 unless selection<11 and selection>0
    return selection
  end

  def add_to_order(selection)
    selection += -1
    puts "You have selected '#{@menu[selection][0]}'. Add to order? (Y/N)"
    check = true
    while check == true
      add = gets.chomp
      if add == "Y"
        @order.push(@menu[selection])
        check = false
      elsif add == "N"
        check = false
      else
        puts "Invalid option. Try again. Add to order? (Y/N)"
      end
    end
  end

  def print_receipt
    puts "RECEIPT:"
    puts "--------"
    puts @order
    puts "--------"
    puts "Total: #{@total} (VAT and Delivery Fees Included)"
    puts "--------"
  end

  def make_order
    puts "Your Order:"
    puts @order
    find_total
    puts "Total: #{@total}"
    puts "Make order? Y/N"
    while true
      make = gets.chomp
      if make == "Y"
        return true
      elsif make == "N"
        return false
      else
        puts "Invalid option. Try again. Make order? (Y/N)"
      end
    end
  end

  def user_interface
    puts "WELCOME"
    check = true
    while check == true
      check1 = true
      while check1 == true
        selection = make_selection
        if selection == 0
          check1 = false
        else
          add_to_order(selection)
        end
      end
      make_status = make_order
      if make_status == true and @total > 0
        @sender.send_message
        print_receipt
        check = false
      elsif make_status == true and @total == 0
        puts "Add some dishes to make order."
      end
    end
  end

end

sender = SendMessage.new
run = TakeOrders.new(sender)
run.user_interface
