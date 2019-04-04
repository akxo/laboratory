/* Write a program that outputs the string representation of numbers from 1 to n.

But for multiples of three it should output “Fizz” instead of the number
and for the multiples of five output “Buzz”.
For numbers which are multiples of both three and five output “FizzBuzz”.

Example:

n = 15,

Return:
[
"1",
"2",
"Fizz",
"4",
"Buzz",
"Fizz",
"7",
"8",
"Fizz",
"Buzz",
"11",
"Fizz",
"13",
"14",
"FizzBuzz"
] */

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var array = [String]()
        for num in 1...n {
            if num % 15 == 0 {
                array.append("FizzBuzz")
            } else if num % 3 == 0 {
                array.append("Fizz")
            } else if num % 5 == 0 {
                array.append("Buzz")
            } else {
                array.append("\(num)")
            }
        }
        return array
    }
}
