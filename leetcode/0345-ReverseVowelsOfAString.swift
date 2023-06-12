/* Given a string s, reverse only all the vowels in the string and return it.
 
The vowels are 'a', 'e', 'i', 'o', and 'u',
and they can appear in both lower and upper cases, more than once.

  

Example 1:

Input: s = "hello"
Output: "holle"

 Example 2:

Input: s = "leetcode"
Output: "leotcede"

Constraints:

1 <= s.length <= 3 * 10^5
s consist of printable ASCII characters. */

class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var chars = Array(s)

        var i = 0
        var j = s.count - 1

        while i < j {
            if !vowels.contains(chars[i]) {
                i += 1
                continue
            }

            if !vowels.contains(chars[j]) {
                j -= 1
                continue
            }
            
            chars.swapAt(i, j)
            i += 1
            j -= 1
        }

        return String(chars)
    }
}
