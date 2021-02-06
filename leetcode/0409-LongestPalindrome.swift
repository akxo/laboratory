/* Given a string s which consists of lowercase or uppercase letters,
return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive,
for example, "Aa" is not considered a palindrome here.

Example 1:

Input: s = "abccccdd"
Output: 7
Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.
 
Example 2:

Input: s = "a"
Output: 1
 
Example 3:

Input: s = "bb"
Output: 2

Constraints:

1 <= s.length <= 2000
s consists of lowercase and/or uppercase English letters only. */

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        return s
            .reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
            .values
            .reduce(0) { $1.isMultiple(of: 2) || $0.isMultiple(of: 2) ? $0 + $1 : $0 + $1 - 1 }
    }
}
