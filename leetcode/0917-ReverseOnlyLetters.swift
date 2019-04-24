/* Given a string S, return the "reversed" string
where all characters that are not a letter stay in the same place,
and all letters reverse their positions.

Example 1:

Input: "ab-cd"
Output: "dc-ba"
 
Example 2:

Input: "a-bC-dEf-ghIj"
Output: "j-Ih-gfE-dCba"
 
Example 3:

Input: "Test1ng-Leet=code-Q!"
Output: "Qedo1ct-eeLg=ntse-T!"

Note:

S.length <= 100
33 <= S[i].ASCIIcode <= 122
S doesn't contain \ or " */

class Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        var chars = Array(S)
        var left = 0
        var right = S.count - 1
        while left < right {
            var leftChar = chars[left]
            guard leftChar.isLetter else { left += 1; continue }
            var rightChar = chars[right]
            guard rightChar.isLetter else { right -= 1; continue }
            chars.swapAt(left, right)
            left += 1
            right -= 1
        }
        return String(chars)
    }
}

extension Character {
    var isLetter: Bool {
        let val = self.unicodeScalars.first!.value
        return (val >= 65 && val <= 90) || (val >= 97 && val <= 122)
    }
}
