/* In a array A of size 2N, there are N+1 unique elements,
and exactly one of these elements is repeated N times.

Return the element repeated N times.

Example 1:

Input: [1,2,3,3]
Output: 3
 
Example 2:

Input: [2,1,2,5,3,2]
Output: 2
 
Example 3:

Input: [5,1,5,2,5,3,5,4]
Output: 5

Note:

4 <= A.length <= 10000
0 <= A[i] < 10000
A.length is even */

class Solution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        var set = Set<Int>()
        for num in A {
            guard !set.contains(num) else { return num }
            set.insert(num)
        }
        return 0
    }
}
