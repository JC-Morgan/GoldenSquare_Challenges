# Take Orders Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

NOTES: -displays list of dishes with prices
       -user is able to select these dishes (to order them)
       -returns an itemised receipt at the end (with a total)
       -sends text message to the user confirming order + delivery time

(must not accidentally push API Key to GitHub)

_________________________________________________
- Displays list of dishes + prices
- Allows user to select etc. ->

- (list)- first option is [0] 'See order'
- Type in the number of your selection:
- #(user types in a number)
- You have selected '(Name of dish)'. Add to order? (Y/N)
- (Takes Y/N) and goes back to list
- 0 from list means the list changes to 'Your Order:' with details on price +total cost (w no index this time)
- Make order? Y/N
- Enter phone number: (for confirmation message) (if Y)
- Displays receipt if Y. All dishes, prices and 'Total: #### (VAT and Delivery Fees Included)'
- goes back to list if N
- sends user text message "Thank You! Your order has been placed and will be delivered by ##:##." (with the time being 1 hour from current time)
_________________________________________________

## 2. Design the Class System

_The general design idea:_

```
TakeOrders- initialize(sender), display_menu, find_total, make_selection, add_to_order(selection), print_receipt, make_order, user_interface.

(TakeOrders is initialized with an instance of SendMessage (sender))

SendMessage- get_phone_number, set_up_client, get_delivery_time, send_message.

(SendMessage requires 'date' and 'twilio-ruby')
```

_The interface of each class in more detail:_

```ruby

class TakeOrders

  def initialize(sender) # sender is an instance of SendMessage
    #No return value.
  end

  def display_menu
    #puts menu with index ([0] See Order / [1] Margherita Pizza - £13)
  end

  def find_total
    #No return value.
  end

  def make_selection
    #Takes the number of the users selection, checks validity- and returns it.
  end

  def add_to_order(selection) # selection is the number of the menu option that was selected by the user.
    #No return value. (other than messages through puts)
  end

  def print_receipt
    #puts Receipt (all ordered menu items + total price)
  end

  def make_order
    #Returns true or false dependent on user input
  end

  def user_interface
    #Runs all other methods in the needed sequence/ upon requirement
  end

end


class SendMessage

  def get_phone_number
    #No return value.
  end

  def set_up_client
    #No return value.
  end

  def get_delivery_time
    #No return value.
  end

  def send_message
    #Sends a message to the given phone number
  end

end

```

## 3. Create Examples as Integration Tests

_Examples of how the program should work (class integration):_

```ruby

# Examples for SendMessage and TakeOrders (integrated):

# 1


# 2

```

## 4. Create Examples as Unit Tests

_Examples of how the program should work (separate classes):_

```ruby

# Examples for SendMessage:

# 1
list = TodoList.new
list.see_list # => []

# 2

# Examples for Diary:
