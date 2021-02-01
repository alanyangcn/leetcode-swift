import Foundation
/*
 * problem url: https://leetcode.com/problems/number-of-good-pairs
 */

/*
 Given an array of integers nums.

 A pair (i,j) is called good if nums[i] == nums[j] and i < j.

 Return the number of good pairs.

  

 Example 1:

 Input: nums = [1,2,3,1,1,3]
 Output: 4
 Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
 Example 2:

 Input: nums = [1,1,1,1]
 Output: 6
 Explanation: Each pair in the array are good.
 Example 3:

 Input: nums = [1,2,3]
 Output: 0
  

 Constraints:

 1 <= nums.length <= 100
 1 <= nums[i] <= 100

 */

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var result = 0
        var map = [Int: Int]()
        for num in nums {
            if let count = map[num] {
                result += count
                map[num] = count + 1
            } else {
                map[num] = 1
            }
        }
        return result
    }
}

let input = [1, 2, 3, 1, 1, 3, 1, 4, 4, 4, 4]
print(Solution().numIdenticalPairs(input))
