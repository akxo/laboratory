/* Given a linked list, remove the n-th node from the end of list and return its head.

Example:

Given linked list: 1->2->3->4->5, and n = 2.

After removing the second node from the end, the linked list becomes 1->2->3->5.
Note:

Given n will always be valid. */

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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil && head?.next != nil else { return nil }
        var dummyHead = ListNode(0)
        dummyHead.next = head
        var nPlus1: ListNode? = dummyHead
        var index = 1
        var curr: ListNode? = dummyHead
        var count = 1
        
        while curr != nil {
            if count - index == n, curr?.next != nil {
                index += 1
                nPlus1 = nPlus1?.next
            }
            count += 1
            curr = curr?.next
        }
        nPlus1?.next = nPlus1?.next?.next
        return dummyHead.next
    }
}
