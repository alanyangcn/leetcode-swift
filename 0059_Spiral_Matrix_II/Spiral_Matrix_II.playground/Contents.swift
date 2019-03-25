import UIKit
/*
 * problem url: https://leetcode.com/problems/to-lower-case
 */

/*
 
 Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
 
 Example:
 
     Input: 3
     Output:
         [
         [ 1, 2, 3 ],
         [ 8, 9, 4 ],
         [ 7, 6, 5 ]
         ]
 */

func generateMatrix(_ n: Int) -> [[Int]] {
    
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    let layer = n / 2 + n % 2 // 总层数
    
    var layerContArray = [Int]()
    for i in 0..<layer {
        layerContArray.append((n - 2 * (i + 1) + 1) * 4)
    }
    
    for i in 0..<result.count {
        
        for j in 0..<result[i].count {
            
            let xLayer = j >= layer ? n - j  : j + 1
            let yLayer = i >= layer ? n - i : i + 1
            let inLayer = xLayer < yLayer ? xLayer : yLayer // 所在层
            
            var preLayerCount = 0
            if inLayer != 1 {
                for i in 0..<inLayer - 1 {
                    preLayerCount += layerContArray[i]
                }
            }
            let currentLayerCount = (n - 2 * inLayer + 1) * 4
            preLayerCount += 1
            
            if i <= j {
                preLayerCount = preLayerCount + i + j - inLayer * 2 + 2
            } else {
                if j == inLayer - 1 {
                    preLayerCount = preLayerCount + currentLayerCount - i + inLayer - 1
                } else {
                    preLayerCount = preLayerCount + currentLayerCount - i - j + inLayer + inLayer - 2
                }
                
            }
            
            result[i][j] = preLayerCount
        }
    }
    return result
}

let result = generateMatrix(7)

for row in result {
    print(row)
}




