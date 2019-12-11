/* Given a non-negative integer num,
repeatedly add all its digits until the result has only one digit.

Example:

Input: 38
Output: 2
 
Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
             Since 2 has only one digit, return it.
 
Follow up:
Could you do it without any loop/recursion in O(1) runtime? */

class Solution {
    func addDigits(_ num: Int) -> Int {
        // guard num >= 10 else { return num }
        // return addDigits(String(num).reduce(0) { $0 + Int($1.description)! })
        
        var sum = 0
        var temp = num
        
        while temp / 10 > 0 {
            sum += temp % 10
            temp = temp / 10
            
            if temp < 10 {
                sum += temp
                
                if sum < 10 {
                    return sum
                }
                
                temp = sum
                sum = 0
            }
        }
        
        return temp
    }
}
