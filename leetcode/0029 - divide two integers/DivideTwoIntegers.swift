/* Given two integers dividend and divisor,
divide two integers without using multiplication, division and mod operator.

Return the quotient after dividing dividend by divisor.

The integer division should truncate toward zero.

Example 1:

Input: dividend = 10, divisor = 3
Output: 3
Example 2:

Input: dividend = 7, divisor = -3
Output: -2
Note:

Both dividend and divisor will be 32-bit signed integers.
The divisor will never be 0.
Assume we are dealing with an environment which could only store
integers within the 32-bit signed integer range: [−231,  231 − 1].
For the purpose of this problem, assume that your function returns 231 − 1
when the division result overflows. */

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        guard abs(divisor) <= abs(dividend) else { return 0 }
        guard divisor != dividend else { return 1 }
        guard divisor != -dividend else { return -1 }
        guard divisor != 1 else { return int32(for: dividend) }
        guard divisor != -1 else { return int32(for: -dividend) }
        
        var sign = -1
        if (divisor > 0 && dividend > 0) || (divisor < 0 && dividend < 0) {
            sign = 1
        }
        let divisor = abs(int32(for: divisor))
        let dividend = abs(int32(for: dividend))
        var quotient = findQuotient(dividend, divisor)
        if sign == -1 {
            quotient = -quotient
        }
        return int32(for: quotient)
    }
    
    func findQuotient(_ dividend: Int, _ divisor: Int) -> Int {
        guard dividend >= divisor else { return 0 }
        
        var quotient = 1
        var sum = divisor
        
        while (sum + sum) < dividend {
            sum += sum
            quotient += quotient
        }
        return quotient + findQuotient(dividend - sum, divisor)
    }
    
    func int32(for num: Int) -> Int {
        if num > Int32.max { return Int(Int32.max) }
        if num < Int32.min { return Int(Int32.min) }
        return num
    }
}
