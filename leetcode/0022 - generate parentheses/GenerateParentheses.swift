/* Given n pairs of parentheses,
write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:

[
"((()))",
"(()())",
"(())()",
"()(())",
"()()()"
] */

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        var sol = [String]()
        add(&sol, 1, 0, n, "(")
        return sol
    }
    
    func add(_ sol: inout [String], _ open: Int, _ closed: Int, _ n: Int, _ str: String) {
        if open == n && closed == n {
            sol.append(str)
            return
        }
        if open < n {
            add(&sol, open + 1, closed, n, str + "(")
        }
        if closed < open {
            add(&sol, open, closed + 1, n, str + ")")
        }
    }
}
