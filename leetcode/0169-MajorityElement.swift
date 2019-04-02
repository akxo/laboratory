/* Given an array of size n, find the majority element.
The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.

Example 1:

Input: [3,2,3]
Output: 3
Example 2:

Input: [2,2,1,1,1,2,2]
Output: 2 */

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        nums
        var dic = [Int : Int]()
        var maj = 0
        var freq = 0
        for num in nums {
            let val = (dic[num] ?? 0) + 1
            dic[num] = val
            if val > freq {
                maj = num
                freq = val
            }
        }
        return maj
    }
}
