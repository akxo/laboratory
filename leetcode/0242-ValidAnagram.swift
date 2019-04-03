/* Given two strings s and t , write a function to determine if t is an anagram of s.

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
Example 2:

Input: s = "rat", t = "car"
Output: false
 
Note:
You may assume the string contains only lowercase alphabets. */

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var count = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        for char in t {
            guard var num = count[char] else { return false }
            num -= 1
            count[char] = num > 0 ? num : nil
        }
        return true
    }
}
