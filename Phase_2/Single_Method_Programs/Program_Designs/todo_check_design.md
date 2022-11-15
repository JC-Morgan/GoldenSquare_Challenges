# TODO Check Method Design Recipe

## 1. Describe the Problem

_The user story and any clarifying notes:_

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO

## 2. Design the Method Signature

_The name of the method, its parameters, return value, and side effects:_

```ruby

check = todo_check(text)

# text is a string with words (that should be a passage or something that the user wishes to check for #TODO)
# check represents a boolean value dependent on the text (true or fail)
```

## 3. Create Examples as Tests

_A list of examples of what the method will take and return:_

```ruby
 todo_check("") => fail "No #TODO in text."
 todo_check("#TODO") => true
 todo_check("This is a test sentence.") => fail "No #TODO in text."
 todo_check("This is a test sentence.#ToDO") => fail "No #TODO in text."
 todo_check("#TODO Feed the dog") => true
 todo_check("Feed the cat#TODO Feed the dog") => true
```

_These examples will be made into tests._

## 4. Implement the Behaviour
