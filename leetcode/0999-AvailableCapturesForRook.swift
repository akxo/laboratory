/* On an 8 x 8 chessboard, there is one white rook.
There also may be empty squares, white bishops, and black pawns.
These are given as characters 'R', '.', 'B', and 'p' respectively.
Uppercase characters represent white pieces, and lowercase characters represent black pieces.

The rook moves as in the rules of Chess:
it chooses one of four cardinal directions (north, east, west, and south),
then moves in that direction until it chooses to stop, reaches the edge of the board,
or captures an opposite colored pawn by moving to the same square it occupies.
Also, rooks cannot move into the same square as other friendly bishops.

Return the number of pawns the rook can capture in one move.

Example 1:

Input: [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","R",".",".",".","p"],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]
Output: 3
Explanation:
In this example the rook is able to capture all the pawns.

Example 2:

Input: [[".",".",".",".",".",".",".","."],[".","p","p","p","p","p",".","."],[".","p","p","B","p","p",".","."],[".","p","B","R","B","p",".","."],[".","p","p","B","p","p",".","."],[".","p","p","p","p","p",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]
Output: 0
Explanation:
Bishops are blocking the rook to capture any pawn.
 
Example 3:

Input: [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","p",".",".",".","."],["p","p",".","R",".","p","B","."],[".",".",".",".",".",".",".","."],[".",".",".","B",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."]]
Output: 3
Explanation:
The rook can capture the pawns at positions b5, d6 and f5.

Note:

board.length == board[i].length == 8
board[i][j] is either 'R', '.', 'B', or 'p'
There is exactly one cell with board[i][j] == 'R' */

class Solution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var rook: (row: Int, col: Int) = (0, 0)
        var count = 0
        outer: for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "R" {
                    rook = (i, j)
                    break outer
                }
            }
        }
        
        // north
        var index = rook.row - 1
        outer: while index >= 0 {
            switch board[index][rook.col] {
            case "p":
                count += 1
                fallthrough
            case "B":
                break outer
            default:
                break
            }
            index -= 1
        }
        
        // east
        index = rook.col + 1
        outer: while index < board[rook.row].count {
            switch board[rook.row][index] {
            case "p":
                count += 1
                fallthrough
            case "B":
                break outer
            default:
                break
            }
            index += 1
        }
        
        // south
        index = rook.row + 1
        outer: while index < board.count {
            switch board[index][rook.col] {
            case "p":
                count += 1
                fallthrough
            case "B":
                break outer
            default:
                break
            }
            index += 1
        }
        
        // west
        index = rook.col - 1
        outer: while index >= 0 {
            switch board[rook.row][index] {
            case "p":
                count += 1
                fallthrough
            case "B":
                break outer
            default:
                break
            }
            index -= 1
        }
        return count
    }
}
