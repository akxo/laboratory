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
        var triplets = [[Int]]()
        var compliments = [Int : Int]()
        var filteredNums = [Int]()
        var existingTriplets = [[Int] : Bool]()
        
        
        for num in nums {
            if var count = compliments[num] {
                if count < 3 {
                    count += 1
                    compliments[num] = count
                    filteredNums.append(num)
                }
            } else {
                compliments[num] = 1
                filteredNums.append(num)
            }
        }
        
        guard filteredNums.count > 2 else { return [] }
        
        for i in 0...filteredNums.count - 2 {
            if var count = compliments[filteredNums[i]], count > 0 {
                count -= 1
                compliments[filteredNums[i]] = count
            }
            for j in (i+1)..<filteredNums.count {
                if var count = compliments[filteredNums[j]], count > 0 {
                    count -= 1
                    compliments[filteredNums[j]] = count
                }
                let c =  (0 - (filteredNums[i] + filteredNums[j]))
                if let count = compliments[c], count > 0 {
                    var arr = [filteredNums[i], filteredNums[j], c]
                    arr = arr.sorted(by: <)
                    if let _ = existingTriplets[arr] {
                        
                    } else {
                        existingTriplets[arr] = true
                        triplets.append(arr)
                    }
                }
                if var count = compliments[filteredNums[j]] {
                    count += 1
                    compliments[filteredNums[j]] = count
                }
            }
            if var count = compliments[filteredNums[i]] {
                count += 1
                compliments[filteredNums[i]] = count
            }
        }
        return triplets
    }
    
    func isUnique(_ newArr: [Int], _ triplets: [[Int]]) -> Bool {
        for arr in triplets {
            var mutArr = arr
            if mutArr.contains(newArr[0]) {
                mutArr.remove(at: mutArr.firstIndex(of: newArr[0])!)
                if mutArr.contains(newArr[1]) {
                    mutArr.remove(at: mutArr.firstIndex(of: newArr[1])!)
                    if mutArr.contains(newArr[2]) {
                        return false
                    }
                }
            }
        }
        return true
    }
}
