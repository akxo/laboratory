/* Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
[-1, 0, 1],
[-1, -1, 2]
] */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        let sorted = nums.sorted(by: <)
        var trips = [[Int]]()
        
        for i in 0...sorted.count - 2 {
            if i == 0 || sorted[i] != sorted[i - 1] {
                var start = i + 1
                var end = sorted.count - 1
                let a = sorted[i]
                let sum = 0 - a
                
                while start < end {
                    let b = sorted[start]
                    let c = sorted[end]
                    
                    if b + c == sum {
                        trips.append([a, b, c])
                        while start < end, b == sorted[start + 1] {
                            start += 1
                        }
                        while start < end, c == sorted[end - 1] {
                            end -= 1
                        }
                        start += 1
                        end -= 1
                    } else if b + c < sum {
                        start += 1
                    } else {
                        end -= 1
                    }
                }
            }
        }
        return trips
    }
}
