/* Given a string containing just the characters '(', ')', '{', '}', '[' and ']',
determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true */

class Solution {
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        guard s.count > 1 else { return false }
        let length = s.count
        var stack = [Character]()
        
        for (index, char) in s.enumerated() {
            guard stack.count < length - index + 1 else { return false }
            if char == "(" {
                stack.append(")")
            } else if char == "{" {
                stack.append("}")
            } else if char == "[" {
                stack.append("]")
            } else {
                guard !stack.isEmpty else { return false }
                let match = stack.removeLast()
                guard char == match else { return false }
            }
        }
        return stack.isEmpty
    }
}
