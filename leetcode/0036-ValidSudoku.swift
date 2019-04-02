/* Determine if a 9x9 Sudoku board is valid.
Only the filled cells need to be validated according to the following rules:

Each row must contain the digits 1-9 without repetition.
Each column must contain the digits 1-9 without repetition.
Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.

A partially filled sudoku which is valid.

The Sudoku board could be partially filled,
where empty cells are filled with the character '.'.

Example 1:

Input:
[
["5","3",".",".","7",".",".",".","."],
["6",".",".","1","9","5",".",".","."],
[".","9","8",".",".",".",".","6","."],
["8",".",".",".","6",".",".",".","3"],
["4",".",".","8",".","3",".",".","1"],
["7",".",".",".","2",".",".",".","6"],
[".","6",".",".",".",".","2","8","."],
[".",".",".","4","1","9",".",".","5"],
[".",".",".",".","8",".",".","7","9"]
]
Output: true
Example 2:

Input:
[
["8","3",".",".","7",".",".",".","."],
["6",".",".","1","9","5",".",".","."],
[".","9","8",".",".",".",".","6","."],
["8",".",".",".","6",".",".",".","3"],
["4",".",".","8",".","3",".",".","1"],
["7",".",".",".","2",".",".",".","6"],
[".","6",".",".",".",".","2","8","."],
[".",".",".","4","1","9",".",".","5"],
[".",".",".",".","8",".",".","7","9"]
]
Output: false
Explanation: Same as Example 1, except with the 5 in the top left corner being
modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
Note:

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.
The given board contain only digits 1-9 and the character '.'.
The given board size is always 9x9. */

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for boxRow in 0..<3 {
            for boxCol in 0..<3 {
                var seen = [Character : Int]()
                for row in boxRow * 3..<boxRow * 3 + 3 {
                    for col in boxCol * 3..<boxCol * 3 + 3 {
                        let num = board[row][col]
                        guard num != "." else { continue }
                        guard seen[num] == nil else { return false }
                        guard isValid(board, row, col) else { return false }
                        seen[num] = 1
                    }
                }
            }
        }
        return true
    }
    
    func isValid(_ board: [[Character]], _ row: Int, _ col: Int) -> Bool {
        let num = board[row][col]
        for i in 0..<9 {
            if board[i][col] == num, i != row { return false }
        }
        for j in 0..<9 {
            if board[row][j] == num, j != col { return false }
        }
        return true
    }
}
