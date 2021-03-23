import Foundation
/*
 * problem url: https://leetcode.com/problems/flatten-nested-list-iterator/
 */

/*
 Given a nested list of integers, implement an iterator to flatten it.

 Each element is either an integer, or a list -- whose elements may also be integers or other lists.

 Example 1:

 Input: [[1,1],2,[1,1]]
 Output: [1,1,2,1,1]
 Explanation: By calling next repeatedly until hasNext returns false,
              the order of elements returned by next should be: [1,1,2,1,1].
 Example 2:

 Input: [1,[4,[6]]]
 Output: [1,4,6]
 Explanation: By calling next repeatedly until hasNext returns false,
              the order of elements returned by next should be: [1,4,6].


 */

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class NestedIterator {
    
    var stack = [([NestedInteger], Int)]()

    init(_ nestedList: [NestedInteger]) {
        stack = [(nestedList, 0)]
    }
    
    func next() -> Int {
        hasNext()
        let (nestedList, i) = stack.last!
        stack[stack.count - 1].1 += 1
        return nestedList[i].getInteger()
    }
    
    func hasNext() -> Bool {

        while stack.count != 0 {
            let (nestedList, i) = stack.last!
            if i == nestedList.count {
                stack.popLast()
            } else {
                var temp = nestedList[i]
                if temp.isInteger() {
                    return true
                }
                stack[stack.count - 1 ].1 += 1
                stack.append((temp.getList(), 0))
            }
        }
        return false
    }
}


/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
