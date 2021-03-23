import Foundation
/*
 * problem url: https://leetcode.com/problems/spiral-matrix
 */

/*
 Given an m x n matrix, return all elements of the matrix in spiral order.

 Example 1:
 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]

 Example 2:
 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 10
 -100 <= matrix[i][j] <= 100

 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rows = matrix.count
        let cols = matrix[0].count
        var left = 0
        var right = cols - 1
        var top = 0
        var bottom = rows - 1
        var array = [Int]()
        while left <= right && top <= bottom {
            for i in left ... right {
                array.append(matrix[top][i])
            }
            if top < bottom {
                for i in top + 1 ... bottom {
                    array.append(matrix[i][right])
                }
            }
            if left < right && top < bottom {
                for i in (left ... right - 1).reversed() {
                    array.append(matrix[bottom][i])
                }
            }
            if left < right && top < bottom - 1 {
                for i in (top + 1 ... bottom - 1).reversed() {
                    array.append(matrix[i][left])
                }
            }
            left += 1
            right -= 1
            top += 1
            bottom -= 1
        }
        return array
    }
}

print(Solution().spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
