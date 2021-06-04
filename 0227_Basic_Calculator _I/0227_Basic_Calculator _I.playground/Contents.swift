import Foundation
/*
 * problem url: https://leetcode.com/problems/basic-calculator-ii
 */

/*
 Given a string s which represents an expression, evaluate this expression and return its value.

 The integer division should truncate toward zero.


 Example 1:

 Input: s = "3+2*2"
 Output: 7
 Example 2:

 Input: s = " 3/2 "
 Output: 1
 Example 3:

 Input: s = " 3+5 / 2 "
 Output: 5
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
 s represents a valid expression.
 All the integers in the expression are non-negative integers in the range [0, 231 - 1].
 The answer is guaranteed to fit in a 32-bit integer.

 */

class Solution {
    func calculate(_ s: String) -> Int {

        var result = 0
        var stack = [Substring]()
        for c in s {
            
        }
        
        return result
    }
}
print(Solution().calculate("3+2*2"))
