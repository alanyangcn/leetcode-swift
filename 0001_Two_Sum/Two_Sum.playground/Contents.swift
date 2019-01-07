import UIKit
/*
 * problem url: https://leetcode.com/problems/two-sum/
 */


/// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
/// You may assume that each input would have exactly one solution, and you may not use the same element twice.
/// Example:

/// Given nums = [2, 7, 11, 15], target = 9,

/// Because nums[0] + nums[1] = 2 + 7 = 9,
/// return [0, 1].
/// - Parameters:
///   - nums: number array
///   - target: sum
/// - Returns: indexes
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for i in 0..<nums.count {
        dict[nums[i]] = i
    }
    for i in 0..<nums.count {
        let found = target - nums[i]
        
        if let j = dict[found], j != i {
            return [i, j]
        }
        
    }
    return [0, 0]
}


twoSum([2,7,11,15], 18)
