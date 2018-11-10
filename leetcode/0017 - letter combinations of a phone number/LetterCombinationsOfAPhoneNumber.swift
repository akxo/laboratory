/* Given a string containing digits from 2-9 inclusive,
return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below.
Note that 1 does not map to any letters.

Example:

Input: "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
Note:

Although the above answer is in lexicographical order,
your answer could be in any order you want. */

class Solution {
    
    var digitDict = [Character : [String]]()
    
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        digitDict["2"] = ["a", "b", "c"]
        digitDict["3"] = ["d", "e", "f"]
        digitDict["4"] = ["g", "h", "i"]
        digitDict["5"] = ["j", "k", "l"]
        digitDict["6"] = ["m", "n", "o"]
        digitDict["7"] = ["p", "q", "r", "s"]
        digitDict["8"] = ["t", "u", "v"]
        digitDict["9"] = ["w", "x", "y", "z"]
        let digits = Array(digits)
        return addDigit(digits, 0, [])
        
    }
    
    func addDigit(_ digits: [Character], _ index: Int, _ arr: [String])-> [String] {
        guard index < digits.count else { return arr }
        var strs = [String]()
        guard index != 0 else {
            for str in digitDict[digits[index]]! {
                strs += [str]
            }
            print(strs)
            return addDigit(digits, index + 1, strs)
        }
        
        for str in digitDict[digits[index]]! {
            var newArr = [String]()
            for element in arr {
                newArr.append(element + str)
            }
            strs += newArr
        }
        return addDigit(digits, index + 1, strs)
    }
}
