/* Given a non-negative integer numRows,
generate the first numRows of Pascal's triangle.

In Pascal's triangle,
each number is the sum of the two numbers directly above it.

Example:

Input: 5
Output:
[
[1],
[1,1],
[1,2,1],
[1,3,3,1],
[1,4,6,4,1]
] */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows != 0 else { return [] }
        guard numRows != 1 else { return [[1]] }
        guard numRows != 2 else { return [[1], [1, 1]] }
        
        var ans = [[1], [1, 1]]
        for i in 2..<numRows {
            var newRow = Array(repeating: 1, count: i + 1)
            for j in 1..<i {
                print(i, j)
                newRow[j] = ans[i - 1][j - 1] + ans[i - 1][j]
            }
            ans.append(newRow)
        }
        return ans
    }
}
