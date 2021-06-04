
import Foundation
/*
 * problem url: https://leetcode.com/problems/top-k-frequent-words/
 */

/*
 Given a non-empty list of words, return the k most frequent elements.

 Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

 Example 1:
    Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
    Output: ["i", "love"]
    Explanation: "i" and "love" are the two most frequent words. Note that "i" comes before "love" due to a lower alphabetical order.
 Example 2:
    Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
    Output: ["the", "is", "sunny", "day"]
    Explanation: "the", "is", "sunny" and "day" are the four most frequent words, with the number of occurrence being 4, 3, 2 and 1 respectively.
 Note:
    You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
    Input words contain only lowercase letters.
 Follow up:
    Try to solve it in O(n log k) time and O(n) extra space.


 */
class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        // 字典 [String : Int]
        let frequentsDict = words.reduce(into: [String: Int]()) { (result, word) in
            result[word, default: 0] += 1
        }
        // 数组 [(String, Int)]
        var frequents = frequentsDict.map { ($0.key, $0.value) }
        buildHeap(&frequents)
        
        var result = [String]()
        for _ in 0..<k {
            guard frequents.count > 0 else { return result }
            let top = topHeap(&frequents)
            result.append(top.0)
        }
        
        return result
    }
    
    func buildHeap(_ heap: inout [(String, Int)]) {
        let count = heap.count / 2
        // 从最底下的非叶子节点，逆着往上遍历
        for index in (0..<count).reversed() {
            shiftDownHeapify(&heap, index: index)
        }
    }
    
    func shiftDownHeapify(_ heap: inout [(String, Int)], index: Int) {
        // 当前节点的左右子节点
        let leftIndex = 2 * index + 1
        let rightIndex = 2 * index + 2
        var maxIndex = index
        if leftIndex < heap.count, judeBiggerThan(a: heap[maxIndex], heap[leftIndex]) {
            maxIndex = leftIndex
        }
        if rightIndex < heap.count, judeBiggerThan(a: heap[maxIndex], heap[rightIndex]) {
            maxIndex = rightIndex
        }
        
        if maxIndex != index {
            heap.swapAt(maxIndex, index)
            shiftDownHeapify(&heap, index: maxIndex)
        }
    }
    
    func judeBiggerThan(a: (String, Int), _ b: (String, Int)) -> Bool {
        if a.1 > b.1 {
            return false
        } else if a.1 < b.1 {
            return true
        } else {
            // 相同次数，用字符判断前后顺序： "a" > "b" // false
            return b.0 < a.0
        }
    }

    // 移出堆顶元素，并重新堆化
    func topHeap(_ heap: inout [(String, Int)]) -> (String, Int) {
        guard !heap.isEmpty else { return ("", -1) }
        if heap.count == 1 {
            // 注意只剩下一个数的情况，heap[0] = heap.removeLast() 会越界
            return heap.removeFirst()
        } else {
            let top = heap[0]
            // 相当于把第一和最后一个元素交换，然后移除最后一个元素
            heap[0] = heap.removeLast()
            // 从顶部 0 开始堆化
            shiftDownHeapify(&heap, index: 0)
            return top
        }
    }

}


print(Solution().topKFrequent(["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 4))
