/* You are given a map in form of a two-dimensional integer grid
where 1 represents land and 0 represents water.

Grid cells are connected horizontally/vertically (not diagonally).
The grid is completely surrounded by water, and there is exactly one island
(i.e., one or more connected land cells).

The island doesn't have "lakes"
(water inside that isn't connected to the water around the island).
One cell is a square with side length 1.
The grid is rectangular, width and height don't exceed 100.
Determine the perimeter of the island.

Example:

Input:
[[0,1,0,0],
[1,1,1,0],
[0,1,0,0],
[1,1,0,0]]

Output: 16 */

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        for i in grid.indices {
            for j in grid[i].indices {
                guard grid[i][j] == 1 else { continue }
                // top
                perimeter += i < 1 ? 1 : grid[i - 1][j] == 1 ? 0 : 1
                // bottom
                perimeter += i == grid.count - 1 ? 1 : grid[i + 1][j] == 1 ? 0 : 1
                // left
                perimeter += j < 1 ? 1 : grid[i][j - 1] == 1 ? 0 : 1
                // right
                perimeter += j == grid[i].count - 1 ? 1 : grid[i][j + 1] == 1 ? 0 : 1
            }
        }
        return perimeter
    }
}
