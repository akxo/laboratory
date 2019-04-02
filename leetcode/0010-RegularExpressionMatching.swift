/* Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.

'.' Matches any single character.
'*' Matches zero or more of the preceding element.
The matching should cover the entire input string (not partial).

Note:

s could be empty and contains only lowercase letters a-z.
p could be empty and contains only lowercase letters a-z, and characters like . or *.
Example 1:

Input:
s = "aa"
p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
Example 2:

Input:
s = "aa"
p = "a*"
Output: true
Explanation: '*' means zero or more of the precedeng element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
Example 3:

Input:
s = "ab"
p = ".*"
Output: true
Explanation: ".*" means "zero or more (*) of any character (.)".
Example 4:

Input:
s = "aab"
p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore it matches "aab".
Example 5:

Input:
s = "mississippi"
p = "mis*is*p*."
Output: false */

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let str = Array(s)
        let pat = Array(p)
        return checkMatch(str, pat)
    }
    
    func checkMatch(_ str: [Character], _ pat: [Character]) -> Bool {
        guard !(pat.isEmpty) else { return str.isEmpty }
        let firstMatch = !(str.isEmpty) && (pat[0] == str[0] || pat[0] == ".")
        
        if pat.count >= 2 && pat[1] == "*" {
            return checkMatch(str, Array(pat.dropFirst(2))) || (firstMatch && checkMatch(Array(str.dropFirst()), pat))
        } else {
            return firstMatch && checkMatch(Array(str.dropFirst()), Array(pat.dropFirst()))
        }
    }
    
}
