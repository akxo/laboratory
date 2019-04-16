/* Given two arrays A and B of equal size,
the advantage of A with respect to B is the number of indices i for which A[i] > B[i].

Return any permutation of A that maximizes its advantage with respect to B.

Example 1:

Input: A = [2,7,11,15], B = [1,10,4,11]
Output: [2,11,7,15]

Example 2:

Input: A = [12,24,8,32], B = [13,25,32,11]
Output: [24,32,8,12]

Note:

1 <= A.length = B.length <= 10000
0 <= A[i] <= 10^9
0 <= B[i] <= 10^9 */

class Solution {
    func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
        let sortedA = A.sorted(by: { $0 < $1 })
        let sortedB = B.sorted(by: { $0 < $1 })
        var assigned: [Int : [Int]] = [:]
        var remaining: [Int] = []
        var j = 0
        for i in 0...A.count - 1 {
            if sortedA[i] > sortedB[j] {
                assigned[sortedB[j]] = (assigned[sortedB[j]] ?? []) + [sortedA[i]]
                j += 1
            } else {
                remaining.append(sortedA[i])
            }
        }
        var solArr: [Int] = []
        var index = 0
        for b in B {
            if assigned[b]?.count ?? 0 > 0,
                let nextKey = assigned[b]?.removeFirst() {
                solArr.append(nextKey)
            } else if index < remaining.count {
                solArr.append(remaining[index])
                index += 1
            }
        }
        return solArr
    }
}
