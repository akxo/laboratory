/* Write an algorithm to determine if a number is "happy".

A happy number is a number defined by the following process:
Starting with any positive integer, replace the number by the
sum of the squares of its digits, and repeat the process until
the number equals 1 (where it will stay), or it loops endlessly
in a cycle which does not include 1. Those numbers for which
this process ends in 1 are happy numbers.

Example:

Input: 19
Output: true
Explanation:
1^2 + 9^2 = 82
8^2 + 2^2 = 68
6^2 + 8^2 = 100
1^2 + 0^2 + 0^2 = 1 */

class Solution {
    
    var seenNumbers = Set<Int>()
    
    func isHappy(_ n: Int) -> Bool {
        guard n != 1 else { return true }
        guard !seenNumbers.contains(n) else { return false }
        seenNumbers.insert(n)
        
        var newNumber = 0
        var num = n
        
        while num > 0 {
            let digit = num % 10
            newNumber += digit * digit
            num /= 10
        }
        return isHappy(newNumber)
    }
}
