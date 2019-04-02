/* Given a string containing just the characters '(' and ')',
find the length of the longest valid (well-formed) parentheses substring.

Example 1:

Input: "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()"
Example 2:

Input: ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()" */

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var maxLength = 0
        var open = 0
        var closed = 0
        
        // left to right
        for char in s {
            if char == "(" {
                open += 1
            } else if char == ")" {
                closed += 1
            }
            if open == closed {
                maxLength = max(maxLength, open * 2)
            } else if closed > open {
                open = 0
                closed = 0
            }
        }
        
        open = 0
        closed = 0
        // right to left
        for char in s.reversed() {
            if char == "(" {
                open += 1
            } else if char == ")" {
                closed += 1
            }
            if open == closed {
                maxLength = max(maxLength, open * 2)
            } else if open > closed {
                open = 0
                closed = 0
            }
        }
        return maxLength
    }
}
