/* Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai).
n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0).
Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.

Example:

Input: [1,8,6,2,5,4,8,3,7]
Output: 49 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxWater = 0
        var left = 0
        var right = height.count - 1
        
        while left < right {
            let heightLeft = height[left]
            let heightRight = height[right]
            let water = min(heightLeft, heightRight) * (right - left)
            maxWater = max(maxWater, water)
            if heightLeft < heightRight {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxWater
    }
}
