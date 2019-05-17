Introduction

The ISBN-10 verification process is used to validate book identification numbers. 
These normally contain dashes and look like: 3-598-21508-8

ISBN


The ISBN-10 format is 9 digits (0 to 9) plus one check character (either a digit or an X only).

In the case the check character is an X, this represents the value '10'. 
These may be communicated with or without hyphens, and can be checked for their validity by the following formula:
(x1 * 10 + x2 * 9 + x3 * 8 + x4 * 7 + x5 * 6 + x6 * 5 + x7 * 4 + x8 * 3 + x9 * 2 + x10 * 1) mod 11 == 0

If the result is 0, then it is a valid ISBN-10, otherwise it is invalid.

Example

Let's take the ISBN-10 3-598-21508-8. 
We plug it in to the formula, and get:
(3 * 10 + 5 * 9 + 9 * 8 + 8 * 7 + 2 * 6 + 1 * 5 + 5 * 4 + 0 * 3 + 8 * 2 + 8 * 1) mod 11 == 0

Since the result is 0, this proves that our ISBN is valid.


Task

Given a string the program should check if the provided string is a valid ISBN-10.

Putting this into place requires some thinking about preprocessing/parsing of the string prior to calculating the check digit for the ISBN.

The program should be able to verify ISBN-10 both with and without separating dashes.

Caveats

Converting from strings to numbers can be tricky in certain languages. Now, it's even trickier since
the check digit of an ISBN-10 may be 'X' (representing '10'). For instance 3-598-21507-X is a valid ISBN-10.

Bonus tasks

Generate a valid ISBN-13 from the input ISBN-10 (and maybe verify it again with a derived verifier).




Considerations

Software should:-
  - Check the string for separating dashes
  - Check that the string is 10 digits long in total
  - Check that the string has 9 digits with values from 0-9
  - Check that the string has a check character with values from      0-9 or 'X'.
  - Multiply consecutive digits in string by 10, 9, 8, 7 and so on.
  - Divide this total by 11.
  - Return true if remainder is 0. Else return false.

Bonus Task:-
  - Check the string for separating dashes
  - Check that the string is 10 digits long in total
  - Remove the final digit
  - Prepend 978 to the string
  - Multiply odd indexed digits by 1 and even indexed digits by 3.
  - Divide this total by 10 and get the remainder.
  - Subtract the remainder from 10 and add the answer on to the end 
    of the parsed string to give a valid ISBN-13 number.



Approach:-
  - Used the specifications to draw the above considerations. 
    Constructing user stories seemed unnecessary for this project.
  - Used TDD to build the project in one class for the original       task. Refactored after every test pass where possible, to keep    methods skinny and code dry.
  - Attempted the bonus task initially in the same class. This        worked fine but looked messy.
  - I moved the tests for the bonus task over to a new file one 
    by one and TDD'd a new class. This helped to reduce responsibility on the original class. The new class uses dependency injection to make use of methods from the original class.





Testing Framework: Rspec
