/* We run a preorder depth first search on the root of a binary tree.

At each node in this traversal, we output D dashes (where D is the depth of this node),
then we output the value of this node.  (If the depth of a node is D,
the depth of its immediate child is D+1.  The depth of the root node is 0.)

If a node has only one child, that child is guaranteed to be the left child.

Given the output S of this traversal, recover the tree and return its root.

Example 1:

Input: "1-2--3--4-5--6--7"
Output: [1,2,5,3,4,6,7]
 
Example 2:

Input: "1-2--3---4-5--6---7"
Output: [1,2,5,3,null,6,null,4,null,7]
 
Example 3:

Input: "1-401--349---90--88"
Output: [1,401,null,349,88,90]
 
Note:

The number of nodes in the original tree is between 1 and 1000.
Each node will have a value between 1 and 10^9. */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func recoverFromPreorder(_ S: String) -> TreeNode? {
        var chars = S.components(separatedBy: "-")
        let root = TreeNode(Int(chars.removeFirst() ?? "0") ?? 0)
        var nodes = [(root, 0)]
        var depth = 1
        for char in chars {
            guard char != "" else { depth += 1; continue }
            while depth <= nodes.last!.1 {
                nodes.removeLast()
            }
            let node = TreeNode(Int(char) ?? 0)
            if nodes.last?.0.left == nil {
                nodes.last?.0.left = node
            } else {
                nodes.last?.0.right = node
            }
            nodes.append((node, depth))
            depth = 1
        }
        return root
    }
}
