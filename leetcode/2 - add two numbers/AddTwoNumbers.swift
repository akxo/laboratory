/* You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
*/

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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var curr: ListNode? = head
        var listNode1 = l1
        var listNode2 = l2
        var rem = 0
        while listNode1 != nil || listNode2 != nil {
            var sum = (listNode1?.val ?? 0) + (listNode2?.val ?? 0) + rem
            rem = sum / 10
            sum = sum % 10
            curr?.next = ListNode(sum)
            curr = curr?.next
            
            listNode1 = listNode1?.next
            listNode2 = listNode2?.next
        }
        if rem > 0 {
            curr?.next = ListNode(rem)
        }
        return head.next
    }
}
