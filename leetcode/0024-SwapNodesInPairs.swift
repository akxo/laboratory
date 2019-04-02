/* Given a linked list, swap every two adjacent nodes and return its head.

Example:

Given 1->2->3->4, you should return the list as 2->1->4->3.
Note:

Your algorithm should use only constant extra space.
You may not modify the values in the list's nodes, only nodes itself may be changed. */

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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var prev: ListNode? = dummyHead
        var curr: ListNode? = head
        var next: ListNode? = head?.next
        
        while prev != nil, curr != nil, next != nil {
            prev?.next = next
            curr?.next = next?.next
            next?.next = curr
            
            prev = curr
            curr = curr?.next
            next = curr?.next
        }
        return dummyHead.next
    }
}
