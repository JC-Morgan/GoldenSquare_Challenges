
class TakeOrders

  def initialize(sender, io) #sender is an instance of SendMessage
    @menu = [["Margherita Pizza", 13], ["Vegetarian Pizza", 16.5], ["Pepperoni Pizza", 16.9], ["Lasagne", 12.3], ["Mushroom Risotto", 13.4],
     ["Seafood Linguine", 16.5], ["Garlic Bread", 5.5], ["Tiramisu", 8], ["Cannoli", 6.2], ["Panna Cotta", 6.7]]
    @order = []
    @sender = sender
    @io = io
  end

  def display_menu
    @io.puts "-----"
    @io.puts "MENU:"
    @io.puts "-----"
    @io.puts "[0] See Order"
    @menu.each_with_index do |item, index|
      @io.puts "[#{index+1}] #{item.first} - £#{item.last}"
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
    @io.puts "Type in the number of your selection: (any invalid input will default to 0)"
    selection = @io.gets.chomp.to_i
    selection = 0 unless selection<11 and selection>0
    return selection
  end

  def add_to_order(selection)
    selection += -1
    @io.puts "You have selected '#{@menu[selection][0]}'. Add to order? (Y/N)"
    check = true
    while check == true
      add = @io.gets.chomp
      if add == "Y"
        @order.push(@menu[selection])
        check = false
      elsif add == "N"
        check = false
      else
        @io.puts "Invalid option. Try again. Add to order? (Y/N)"
      end
    end
  end

  def print_receipt
    @io.puts "RECEIPT:"
    @io.puts "--------"
    @io.puts @order
    @io.puts "--------"
    @io.puts "Total: #{@total} (VAT and Delivery Fees Included)"
    @io.puts "--------"
  end

  def make_order
    @io.puts "Your Order:"
    @io.puts @order
    find_total
    @io.puts "Total: #{@total}"
    @io.puts "Make order? Y/N"
    while true
      make = @io.gets.chomp
      if make == "Y"
        return true
      elsif make == "N"
        return false
      else
        @io.puts "Invalid option. Try again. Make order? (Y/N)"
      end
    end
  end

  def user_interface
    @io.puts "WELCOME"
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
        @sender.get_phone_number
        @io.puts @sender.send_message
        print_receipt
        check = false
      elsif make_status == true and @total == 0
        @io.puts "Add some dishes to make order."
      end
    end
  end

end

