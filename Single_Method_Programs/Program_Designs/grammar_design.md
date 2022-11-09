# Grammar Method Design Recipe

## 1. Describe the Problem

_The user story and any clarifying notes:_

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_The name of the method, its parameters, return value, and side effects:_

```ruby
check = grammar_check(text)

# text is a string with words (that should be a passage or something that the user wants to check the grammar of)
# check represents a boolean value dependent on the content of the text (true or fail)
```

## 3. Create Examples as Tests

_A list of examples of what the method will take and return:_

```ruby
grammar_check("") => fail "Not a sentence."
grammar_check("Hello") => fail "Not a sentence."
grammar_check("hello.") => fail "Not a sentence."
grammar_check("Hello, my name is Lucas.") => true
grammar_check("Hello, my name is Lucas!") => true
grammar_check("Hello, my name is Lucas?") => true
grammar_check("Hello, my name is Lucas,") => fail "Not a sentence."
grammar_check("hello, my name is Lucas,") => fail "Not a sentence."
```

_These examples will be made into tests._

## 4. Implement the Behaviour
