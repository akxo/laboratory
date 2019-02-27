/* Given an array of integers nums sorted in ascending order,
find the starting and ending position of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1] */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var index = -1
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let middle = (left + right) / 2
            if nums[middle] == target {
                index = middle
                break
            } else if nums[middle] > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        guard index != -1 else { return [index, index] }
        
        var first = index
        while first > 0 {
            if nums[first - 1] == target  {
                first -= 1
            } else {
                break
            }
        }
        
        var last = index
        while last < nums.count - 1 {
            if nums[last + 1] == target  {
                last += 1
            } else {
                break
            }
        }
        return [first, last]
    }
}

