/* Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example 1:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.
Example 2:

Input: "cbbd"
Output: "bb" */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return "" }
        var start = 0
        var end = 0
        let chars = Array(s)
        for i in 0..<s.count {
            let len1 = expandAroundCenter(chars, i, i)
            let len2 = expandAroundCenter(chars, i, i + 1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        var sol = ""
        for j in start...end {
            sol.append(chars[j])
        }
        return sol
    }
    
    func expandAroundCenter(_ arr: [Character], _ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right
        while l >= 0 && r < arr.count && arr[l] == arr[r] {
            l += -1
            r += 1
        }
        return r - l - 1
    }
}
