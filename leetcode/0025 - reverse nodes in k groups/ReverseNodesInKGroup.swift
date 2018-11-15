/* Given a linked list, reverse the nodes of a linked list k at a time
and return its modified list.

k is a positive integer and is less than or equal to the length of the linked list.
If the number of nodes is not a multiple of k then left-out nodes
in the end should remain as it is.

Example:

Given this linked list: 1->2->3->4->5

For k = 2, you should return: 2->1->4->3->5

For k = 3, you should return: 3->2->1->4->5

Note:

Only constant extra memory is allowed.
You may not alter the values in the list's nodes, only nodes itself may be changed. */

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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var test: ListNode? = dummyHead
        var curr: ListNode? = dummyHead
        var count = 0
        while test?.next != nil {
            test = test?.next
            count += 1
            
            guard count % k == 0 else { continue }
            var next = test?.next
            test?.next = nil
            
            
            curr?.next = reverse(curr?.next)
            
            while curr?.next != nil {
                curr = curr?.next
            }
            curr?.next = next
            test = curr
        }
        return dummyHead.next
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var old: ListNode? = head
        var new: ListNode? = nil
        
        while old != nil {
            let next = old?.next
            old?.next = new
            new = old
            old = next
        }
        return new
    }
}
