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

// merge sort - like
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 1 else { return lists.first ?? nil }
        return divide(lists)
    }
    
    func divide(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 1 else { return lists[0] }
        
        let left = Array(lists[0..<lists.count / 2])
        let right = Array(lists[lists.count / 2..<lists.count])
        
        return merge(divide(left), divide(right))
    }
    
    func merge(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var dummyHead = ListNode(0)
        var curr: ListNode? = dummyHead
        var currLeft = left
        var currRight = right
        
        while currLeft != nil && currRight != nil {
            if currLeft!.val < currRight!.val {
                curr?.next = currLeft
                currLeft = currLeft?.next
            } else {
                curr?.next = currRight
                currRight = currRight?.next
            }
            curr = curr?.next
        }
        
        if currLeft == nil {
            curr?.next = currRight
        } else {
            curr?.next = currLeft
        }
        return dummyHead.next
    }
}

// creates sorted list from sorting a compilation array from each list
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
