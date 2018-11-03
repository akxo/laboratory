/* Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
Note:

All given inputs are in lowercase letters a-z. */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard var lcp = strs.min(by: { $0.count < $1.count }) else { return "" }
        
        for str in strs {
            while !str.hasPrefix(lcp), !lcp.isEmpty {
                lcp.removeLast()
            }
        }
        return lcp
    }
}
