/* Given a non-empty array of integers, return the k most frequent elements.

Example 1:

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
Example 2:

Input: nums = [1], k = 1
Output: [1]
Note:

You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
Your algorithm's time complexity must be better than O(n log n),
where n is the array's size. */

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        return Array(dict.sorted { $0.1 > $1.1 }.map { $0.0 }[0..<k])
    }
}
