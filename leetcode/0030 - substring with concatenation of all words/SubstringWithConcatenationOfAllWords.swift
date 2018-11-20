/* You are given a string, s, and a list of words, words,
that are all of the same length.
Find all starting indices of substring(s) in sthat is a concatenation
of each word in words exactly once and without any intervening characters.

Example 1:

Input:
s = "barfoothefoobarman",
words = ["foo","bar"]
Output: [0,9]
Explanation: Substrings starting at index 0 and 9 are "barfoor" and "foobar" respectively.
The output order does not matter, returning [9,0] is fine too.
Example 2:

Input:
s = "wordgoodstudentgoodword",
words = ["word","student"]
Output: [] */

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard s.count != 0 else { return [] }
        guard let length = words.first?.count, length <= s.count else { return [] }
        guard words.count * length <= s.count else { return [] }
        
        var sol = [Int]()
        var count = [String : Int]()
        for word in words {
            if let num = count[word] {
                count[word] = num + 1
            } else {
                count[word] = 1
            }
        }
        let str = Array(s)
        var start = 0
        
        for i in start...s.count - (length * words.count) {
            var found = [String : Int]()
            var j = 0
            
            while j < words.count {
                let start = (j * length) + i
                let end = ((j + 1) * length) + i
                let word = String(str[start..<end])
                if let num = count[word] {
                    if let seen = found[word] {
                        found[word] = seen + 1
                    } else {
                        found[word] = 1
                    }
                    if found[word]! > num {
                        break
                    }
                } else {
                    break
                }
                j += 1
                
                if j == words.count {
                    sol.append(i)
                }
            }
        }
        return sol
    }
}
