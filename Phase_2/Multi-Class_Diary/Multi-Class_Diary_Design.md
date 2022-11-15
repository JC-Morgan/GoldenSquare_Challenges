# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


NOTES: -display all diary entries   -choose a diary entry readable in a time (given reading speed)
       -todo list                   -contacts in a list (from diary entries)

## 2. Design the Class System

_The general design idea:_

```
Diary- add(entry), all_entries, readable_within_time(wpm,minutes), count_words(entry), reading_time(entry,wpm)

TodoList- add(todo), see_list

Contacts- contacts_list, contacts_check(entry), contacts_gather   (integrated with Diary)




```

_The interface of each class in more detail:_

```ruby

class Diary

  def initialize
    #No return value.
  end

  def add(entry) # entry is a string representing a diary entry that the user wants to add
    #No return value.
  end

  def all_entries
    #Returns list of all entries in diary (list of strings)
  end

  def count_words(entry) # entry is a string representing a diary entry
    #Returns sum of all words in the diary entry (integer)
  end

  def reading_time(entry,wpm) # entry is a string representing a diary entry, wpm is the user's reading speed as a number (in wpm)
    #Returns the amount of time it will take to read the entry, given the reading speed (number- minutes)
  end

  def readable_within_time(wpm,minutes) # wpm is the user's reading speed as a number (in wpm), minutes is a number representing the time that the user is available to read during (minutes)
    #Returns the largest entry that is readable within that given time. (given reading speed) (string)
  end

end


class TodoList

  def initialize
    #No return value.
  end

  def add(todo) # todo is a string representing a todo
    #No return value.
  end

  def see_list
    #Returns list of todos (list of strings)
  end

end



class Contacts

  def initialize(entries) # entries represents all_entries from Diary (list of strings)
    #No return value.
  end

  def contacts_list
    #Returns the list of all phone numbers found in all of the entries from Diary
  end

  def contacts_check(entry) # entry is a string representing a diary entry (from Diary)
    #Returns number(s) from the entry
  end

  def contacts_gather
   #Returns number(s) from all of the entries
  end

end

```

## 3. Create Examples as Integration Tests

_Examples of how the program should work (class integration):_

```ruby

# Examples for Contacts (integrated with Diary):

# 1
my_diary = Diary.new
my_diary.add("Today, I rode a bike")
numbers = Contacts.new(my_diary.all_entries)
numbers.contacts_list # => []

# 2
my_diary = Diary.new
my_diary.add("Today, I rode a bike. 01453777555")
numbers = Contacts.new(my_diary.all_entries)
numbers.contacts_list # => ["01453777555"]

# 3
my_diary = Diary.new
my_diary.add("Today, I rode a bike. 01453777555")
my_diary.add("Jane: 01453654475")
numbers = Contacts.new(my_diary.all_entries)
numbers.contacts_list # => ["01453777555","01453654475"]

# 4
my_diary = Diary.new
my_diary.add("Today, I rode a bike. 01453777555 01453654475")
numbers = Contacts.new(my_diary.all_entries)
numbers.contacts_list # => ["01453777555","01453654475"]

# 5
my_diary = Diary.new
my_diary.add("Today, I rode a bike. jkh01453777555ujg")
numbers = Contacts.new(my_diary.all_entries)
numbers.contacts_list # => ["01453777555"]

# 6
my_diary = Diary.new
my_diary.add("Today, I rode a bike. 0643578")
numbers = Contacts.new(my_diary.all_entries)
numbers.contacts_list # => []


```

## 4. Create Examples as Unit Tests

_Examples of how the program should work (separate classes):_

```ruby

# Examples for TodoList:

# 1
list = TodoList.new
list.see_list # => []

# 2
list = TodoList.new
list.add("Feed the dog")
list.see_list # => ["Feed the dog"]

# 3
list = TodoList.new
list.add("Feed the dog")
list.add("Clean the kitchen")
list.see_list # => ["Feed the dog","Clean the kitchen"]

# Examples for Diary:

# 1
my_diary = Diary.new
my_diary.all_entries # => []

# 2
my_diary = Diary.new
my_diary.add("Today, I rode a bike")
my_diary.all_entries # => ["Today, I rode a bike"]

# 3
my_diary = Diary.new
my_diary.add("Today, I rode a bike")
my_diary.add("Hi Diary, It's my birthday!")
my_diary.all_entries # => ["Today, I rode a bike","Hi Diary, It's my birthday!"]

# 4
my_diary = Diary.new
my_diary.add("Today, I rode a bike")
my_diary.add("Hi Diary, it's my birthday today and we went to the arcade!")
my_diary.readable_within_time(2,7) # => "Hi Diary, it's my birthday today and we went to the arcade!"

# 5
my_diary = Diary.new
my_diary.add("Today, I rode a bike")
my_diary.add("Hi Diary, it's my birthday today and we went to the arcade!")
my_diary.readable_within_time(2,3) # => "Today, I rode a bike"


# 6
my_diary = Diary.new
my_diary.add("Today, I rode a bike")
my_diary.add("Hi Diary, it's my birthday today and we went to the arcade!")
my_diary.readable_within_time(2,2.5) # => "Today, I rode a bike"


# 7
my_diary = Diary.new
my_diary.readable_within_time(2,4) # => nil

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_(Following the test-driving process of red, green, refactor)_
