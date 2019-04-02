/* Given an array nums of n integers and an integer target,
find three integers in nums such that the sum is closest to target.
Return the sum of the three integers.
You may assume that each input would have exactly one solution.

Example:

Given array nums = [-1, 2, 1, -4], and target = 1.

The sum that is closest to the target is 2. (-1 + 2 + 1 = 2). */

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var closest = nums[0] + nums[1] + nums[2]
        let sorted = nums.sorted(by: <)
        
        for i in 0...sorted.count - 2 {
            guard i == 0 || sorted[i] != sorted[i - 1] else { continue }
            var start = i + 1
            var end = sorted.count - 1
            
            while start < end {
                let sum = sorted[i] + sorted[start] + sorted[end]
                if sum == target {
                    return sum
                } else if sum < target {
                    start += 1
                    while start < end, sorted[start] == sorted[start - 1] {
                        start += 1
                    }
                } else {
                    end -= 1
                    while start < end, sorted[end] == sorted[end + 1] {
                        end -= 1
                    }
                }
                if abs(sum - target) < abs(closest - target) {
                    closest = sum
                }
            }
        }
        return closest
    }
}
