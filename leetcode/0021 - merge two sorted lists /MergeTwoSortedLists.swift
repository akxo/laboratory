/* Merge two sorted linked lists and return it as a new list.
The new list should be made by splicing together the nodes of the first two lists.

Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4 */

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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil, l2 == nil { return nil }
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }
        
        var l3 = ListNode(0)
        var curr1: ListNode? = l1
        var curr2: ListNode? = l2
        var curr3: ListNode? = l3
        
        while curr1 != nil || curr2 != nil {
            if curr2 == nil || curr2!.val > curr1?.val ?? .max  {
                curr3?.next = curr1
                curr1 = curr1?.next
            } else {
                curr3?.next = curr2
                curr2 = curr2?.next
            }
            curr3 = curr3?.next
        }
        return l3.next
    }
}
