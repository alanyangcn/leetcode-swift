import UIKit
/*
 * problem url: https://leetcode.com/problems/valid-parentheses
 */

/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.
 
 Example 1:
 
 Input: "()"
 Output: true
 Example 2:
 
 Input: "()[]{}"
 Output: true
 Example 3:
 
 Input: "(]"
 Output: false
 Example 4:
 
 Input: "([)]"
 Output: false
 Example 5:
 
 Input: "{[]}"
 Output: true
 */
func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    
    for c in s {
        if let last = stack.last {
            if (c == ")" && last == "(") || (c == "]" && last == "[") || (c == "}" && last == "{") {
                stack.popLast()
            } else {
                stack.append(c)
            }
        } else {
            stack.append(c)
        }
        
    }
    if stack.count == 0  {
        return true
    }
    
    return false
}
isValid("{}(){}")
