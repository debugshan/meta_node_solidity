// SPDX-License-Identifier: MIT
pragma solidity 0.8;


// ✅  合并两个有序数组 (Merge Sorted Array)
// 题目描述：将两个有序数组合并为一个有序数组。

contract merge {

    function sum(uint[] memory arr, uint[] memory brr) public pure returns (uint[] memory result){
        uint p1 = arr.length - 1;
        uint p2 = brr.length - 1;
        if (p1 == 0 && p2 == 0) {
            return result;
        }
        for (uint i = p1 + p2 - 1; i >= 0; i--) {
            if (p2 >= 0) {
                if ((p1 >= 0) && (arr[p1] > brr[p2])){
                    result[i] = arr[p1]; // 填入 nums1[p1]
                    p1--;
                 } else {
                    result[i] = brr[p2]; // 填入 nums2[p1]
                    p2--;
                 }
            }
        }
    
    }
    
}


// ✅  二分查找 (Binary Search)
// 题目描述：在一个有序数组中查找目标值。

contract BinarySearch{
    // 闭区间写法
// func lowerBound(nums []int, target int) int {
//     left, right := 0, len(nums)-1 // 闭区间 [left, right]
//     for left <= right {           // 区间不为空
//         // 循环不变量：
//         // nums[left-1] < target
//         // nums[right+1] >= target
//         mid := left + (right-left)/2
//         if nums[mid] < target {
//             left = mid + 1 // 范围缩小到 [mid+1, right]
//         } else {
//             right = mid - 1 // 范围缩小到 [left, mid-1]
//         }
//     }
//     return left // 或者 right+1
// }


    function binarySearch(uint[] memory nums, uint target) public pure returns (uint index){
        uint left = 0;
        uint right = nums.length - 1;
        while ((left <= right)) { // [left, right]
            if (nums[left] < target && target <= nums[right]) { break;}
            uint mid = left + (right-left)/2;
            if (target > nums[mid]) { 
                left = mid+1;
            } else{
                right = mid - 1;
             }
        }
        return left;
    }

}