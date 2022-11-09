# Reading Time Method Design Recipe

## 1. Describe the Problem

_The user story and any clarifying notes:_

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

_The name of the method, its parameters, return value, and side effects:_

```ruby
time = reading_time(text)

# text is a string with words (that should be a passage or something that the user wants to check reading time for)
# time is a variable storing the time in minutes (as an integer) that it would take a user to read the text (given that they read 200 wpm)
```

## 3. Create Examples as Tests

_A list of examples of what the method will take and return:_

```ruby
reading_time("") => 0
reading_time("Word") => 1
reading_time(TWO_HUNDRED_WORDS) => 1
reading_time(THREE_HUNDRED_WORDS) => 2
reading_time(SIX_HUNDRED_WORDS) => 3

# return values may be presented like so -> "1 minute(s)"
```

_These examples will be made into tests._

## 4. Implement the Behaviour

