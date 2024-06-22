import UIKit

//### Problem Solving:
//```
//You are given an array arr[] of N integers including 0. The task is to find the smallest positive number missing from the array.
//
//Example 1:
//
//Input:
//N = 5
//arr[] = {1,2,3,4,5}
//Output: 6
//Explanation: Smallest positive missing
//number is 6.
//
//Example 2:
//
//Input:
//N = 5
//arr[] = {0,-10,1,3,-20}
//Output: 2
//Explanation: Smallest positive missing
//number is 2.
//Your Task:
//The task is to complete the function missingNumber() which returns the smallest positive missing number in the array.
//
//Expected Time Complexity: O(N).
//Expected Auxiliary Space: O(1).
//
//Constraints:
//1 <= N <= 106
//-106 <= arr[i] <= 106
//```
// solving

// we take it as inout to not make copy of array so you have to give the array in variable not constant for the space Complexity to be always O (1)

func missingNumber( _ arr: inout [Int]) -> Int {
    
    // the length of array
    var length = arr.count
    // the small positive number
    var answer = 0
    
    // check if we have number 1 in array if not number 1 will be the answer
    for number in arr {
        if number == 1 {
            answer = 1
            break
        }
    }
    
    if answer == 0 {
        return 1
    }
    
    // check if we have value less than 0 or more than the lenght of array mark it as 1
    for i in 0 ..< length {
        if arr[i] <= 0 || arr[i] > length {
            arr[i] = 1
        }
    }
    
    // increase the value by length, get the value by index - 1 modules by length, updating the values by increase length above it
    for i in 0 ..< length {
        arr[(arr[i] - 1) % length] += length
    }
    
    // so now we can iterate to get the value less than or equal length, if we found it we can get more than i by 1
    for i in 0 ..< length {
        if arr[i] <= length {
            return(i + 1)
        }
    }
    // if array has values from 1 to length
    return(length + 1)
}
var x = [-1, 3, 0, 5, 8, 1]

print(missingNumber(&x))
