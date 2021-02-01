import Foundation
/*
 * problem url: https://leetcode.com/problems/can-place-flowers
 */

/*
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

  

 Example 1:

 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 Example 2:

 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
  

 Constraints:

 1 <= flowerbed.length <= 2 * 104
 flowerbed[i] is 0 or 1.
 There are no two adjacent flowers in flowerbed.
 0 <= n <= flowerbed.length

 */

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {

        if n <= 0 {
            return true
        }
        
        var num = 0
        var f = flowerbed
        for i in 0..<f.count {
            if f[i] == 1 {
                continue
            }
            
            if i > 0 && f[i - 1] == 1 {
                continue
            }
            
            if i < f.count - 1 && f[i + 1] == 1 {
                continue
            }
            num += 1
            f[i] = 1
            if num == n {
                return true
            }
            
        }
        
        return false
    }
}
print(Solution().canPlaceFlowers([1,0,0,0,1], 2))
