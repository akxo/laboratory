/* Starting with a positive integer N,
we reorder the digits in any order (including the original order)
such that the leading digit is not zero.

Return true if and only if we can do this in a way such that the resulting number is a power of 2.

Example 1:

Input: 1
Output: true
 
Example 2:

Input: 10
Output: false
 
Example 3:

Input: 16
Output: true
 
Example 4:

Input: 24
Output: false
 
Example 5:

Input: 46
Output: true

Note:

1 <= N <= 10^9 */

class Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        guard N > 2 else { return true }
        for i in 0..<29 {
            let powerStr = String(2 << i)
            let nStr = String(N)
            guard powerStr.count <= nStr.count else { return false }
            if powerStr.count == nStr.count {
                let powerDict = powerStr.reduce(into: [:]) { $0[$1, default: 0] += 1 }
                let nDict = nStr.reduce(into: [:]) { $0[$1, default: 0] += 1 }
                if powerDict == nDict {
                    return true
                }
            }
        }
        return false
    }
}
