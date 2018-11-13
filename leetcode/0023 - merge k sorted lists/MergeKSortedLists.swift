/* Merge k sorted linked lists and return it as one sorted list.
Analyze and describe its complexity.

Example:

Input:
[
1->4->5,
1->3->4,
2->6
]
Output: 1->1->2->3->4->4->5->6 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 1 else { return lists.first ?? nil }
        var dummyHead = ListNode(0)
        var curr = dummyHead
        var values = [Int]()
        
        for list in lists {
            var curr = list
            while curr != nil {
                values.append(curr!.val)
                curr = curr?.next
            }
        }
        
        values = values.sorted(by: <)
        
        for val in values {
            curr.next = ListNode(val)
            curr = curr.next!
        }
        
        return dummyHead.next
    }
}
