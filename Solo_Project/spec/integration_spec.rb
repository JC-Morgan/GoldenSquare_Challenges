require 'send_message_test'
require 'take_orders_test'
require 'date'



describe "take orders integration" do


  it "displays welcome, displays menu, takes order of one item, makes order + confirms" do

    io = double :io

    expect(io).to receive(:puts).with("WELCOME")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You have selected 'Margherita Pizza'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("0")
    expect(io).to receive(:puts).with("Your Order:")
    expect(io).to receive(:puts).with([["Margherita Pizza", 13]])
    expect(io).to receive(:puts).with("Total: 13")
    expect(io).to receive(:puts).with("Make order? Y/N")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("Enter phone number for confirmation message: (in form +447754034209)")
    expect(io).to receive(:gets).and_return(" ")

    expect(io).to receive(:puts).with("Thank You! Your order has been placed and will be delivered by 15:35.")

    expect(io).to receive(:puts).with("RECEIPT:")
    expect(io).to receive(:puts).with("--------")
    expect(io).to receive(:puts).with([["Margherita Pizza", 13]])
    expect(io).to receive(:puts).with("--------")
    expect(io).to receive(:puts).with("Total: 13 (VAT and Delivery Fees Included)")
    expect(io).to receive(:puts).with("--------")


    current_time = Time.new(2022, 11, 17, 14, 35, 17)
    sender = SendMessage.new(io, current_time)
    run = TakeOrders.new(sender, io)
    run.user_interface

  end

  it "displays welcome, displays menu, takes order of two items, makes order + confirms" do

    io = double :io

    expect(io).to receive(:puts).with("WELCOME")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You have selected 'Margherita Pizza'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")


    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("10")
    expect(io).to receive(:puts).with("You have selected 'Panna Cotta'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("0")
    expect(io).to receive(:puts).with("Your Order:")
    expect(io).to receive(:puts).with([["Margherita Pizza", 13], ["Panna Cotta", 6.7]])
    expect(io).to receive(:puts).with("Total: 19.7")
    expect(io).to receive(:puts).with("Make order? Y/N")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("Enter phone number for confirmation message: (in form +447754034209)")
    expect(io).to receive(:gets).and_return(" ")

    expect(io).to receive(:puts).with("Thank You! Your order has been placed and will be delivered by 15:35.")

    expect(io).to receive(:puts).with("RECEIPT:")
    expect(io).to receive(:puts).with("--------")
    expect(io).to receive(:puts).with([["Margherita Pizza", 13], ["Panna Cotta", 6.7]])
    expect(io).to receive(:puts).with("--------")
    expect(io).to receive(:puts).with("Total: 19.7 (VAT and Delivery Fees Included)")
    expect(io).to receive(:puts).with("--------")


    current_time = Time.new(2022, 11, 17, 14, 35, 17)
    sender = SendMessage.new(io, current_time)
    run = TakeOrders.new(sender, io)
    run.user_interface

  end

  it "displays welcome, displays menu, takes order of three items, but takes a fourth only to have it cancelled, makes order + confirms" do

    io = double :io

    expect(io).to receive(:puts).with("WELCOME")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You have selected 'Margherita Pizza'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")


    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("10")
    expect(io).to receive(:puts).with("You have selected 'Panna Cotta'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("8")
    expect(io).to receive(:puts).with("You have selected 'Tiramisu'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("4")
    expect(io).to receive(:puts).with("You have selected 'Lasagne'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("N")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("0")
    expect(io).to receive(:puts).with("Your Order:")
    expect(io).to receive(:puts).with([["Margherita Pizza", 13], ["Panna Cotta", 6.7], ["Tiramisu", 8]])
    expect(io).to receive(:puts).with("Total: 27.7")
    expect(io).to receive(:puts).with("Make order? Y/N")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("Enter phone number for confirmation message: (in form +447754034209)")
    expect(io).to receive(:gets).and_return(" ")

    expect(io).to receive(:puts).with("Thank You! Your order has been placed and will be delivered by 15:35.")

    expect(io).to receive(:puts).with("RECEIPT:")
    expect(io).to receive(:puts).with("--------")
    expect(io).to receive(:puts).with([["Margherita Pizza", 13], ["Panna Cotta", 6.7], ["Tiramisu", 8]])
    expect(io).to receive(:puts).with("--------")
    expect(io).to receive(:puts).with("Total: 27.7 (VAT and Delivery Fees Included)")
    expect(io).to receive(:puts).with("--------")


    current_time = Time.new(2022, 11, 17, 14, 35, 17)
    sender = SendMessage.new(io, current_time)
    run = TakeOrders.new(sender, io)
    run.user_interface

  end

  it "displays welcome, displays menu, refuses to make an empty order, takes order of one item, has order denied, adds another item, makes order + confirms" do

    io = double :io

    expect(io).to receive(:puts).with("WELCOME")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("0")
    expect(io).to receive(:puts).with("Your Order:")
    expect(io).to receive(:puts).with([])
    expect(io).to receive(:puts).with("Total: 0")
    expect(io).to receive(:puts).with("Make order? Y/N")
    expect(io).to receive(:gets).and_return("Y")
    expect(io).to receive(:puts).with("Add some dishes to make order.")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You have selected 'Margherita Pizza'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You have selected 'Margherita Pizza'. Add to order? (Y/N)")
    expect(io).to receive(:gets).and_return("N")

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("0")
    expect(io).to receive(:puts).with("Your Order:")
    expect(io).to receive(:puts).with([["Margherita Pizza", 13]])
    expect(io).to receive(:puts).with("Total: 13")
    expect(io).to receive(:puts).with("Make order? Y/N")
    expect(io).to receive(:gets).and_return("Y")

    expect(io).to receive(:puts).with("Enter phone number for confirmation message: (in form +447754034209)")
    expect(io).to receive(:gets).and_return(" ")

    expect(io).to receive(:puts).with("Thank You! Your order has been placed and will be delivered by 15:35.")

    expect(io).to receive(:puts).with("RECEIPT:")
    expect(io).to receive(:puts).with("--------")
    expect(io).to receive(:puts).with([["Margherita Pizza", 13]])
    expect(io).to receive(:puts).with("--------")
    expect(io).to receive(:puts).with("Total: 13 (VAT and Delivery Fees Included)")
    expect(io).to receive(:puts).with("--------")


    current_time = Time.new(2022, 11, 17, 14, 35, 17)
    sender = SendMessage.new(io, current_time)
    run = TakeOrders.new(sender, io)
    run.user_interface

  end

  it "selection defaults to 0" do

    io = double :io

    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("100")


    current_time = Time.new(2022, 11, 17, 14, 35, 17)
    sender = SendMessage.new(io, current_time)
    run = TakeOrders.new(sender, io)
    expect(run.make_selection).to eq 0


    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("MENU:")
    expect(io).to receive(:puts).with("-----")
    expect(io).to receive(:puts).with("[0] See Order")
    expect(io).to receive(:puts).with("[1] Margherita Pizza - £13")
    expect(io).to receive(:puts).with("[2] Vegetarian Pizza - £16.5")
    expect(io).to receive(:puts).with("[3] Pepperoni Pizza - £16.9")
    expect(io).to receive(:puts).with("[4] Lasagne - £12.3")
    expect(io).to receive(:puts).with("[5] Mushroom Risotto - £13.4")
    expect(io).to receive(:puts).with("[6] Seafood Linguine - £16.5")
    expect(io).to receive(:puts).with("[7] Garlic Bread - £5.5")
    expect(io).to receive(:puts).with("[8] Tiramisu - £8")
    expect(io).to receive(:puts).with("[9] Cannoli - £6.2")
    expect(io).to receive(:puts).with("[10] Panna Cotta - £6.7")

    expect(io).to receive(:puts).with("Type in the number of your selection: (any invalid input will default to 0)")
    expect(io).to receive(:gets).and_return("Mushroom Risotto")

    run = TakeOrders.new(sender, io)
    expect(run.make_selection).to eq 0

  end

end

