/* Given a 32-bit signed integer, reverse digits of an integer.

Example 1:

Input: 123
Output: 321
Example 2:

Input: -123
Output: -321
Example 3:

Input: 120
Output: 21
Note:
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows. */

class Solution {
    func reverse(_ x: Int) -> Int {
        let neg = x < 0
        let mag = abs(x)
        let str = String(String(mag).reversed())
        let sol = Int(str) ?? 0
        return Int32.max >= sol ? neg ? sol * -1 : sol : 0
    }
}
