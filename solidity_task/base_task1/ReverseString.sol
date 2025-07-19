// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


/*
✅ 反转字符串 (Reverse String)
题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"
*/


contract ReverseString{

 function Reverse(string memory _input) public pure returns (string memory){
        bytes memory ret = bytes(_input);
        uint256 len = ret.length;


        for (uint256 i = 0; i < len / 2; i++) {
            bytes1 flag = ret[i];
            ret[i] = ret[len - i - 1];
            ret[len - i - 1] = flag;
        }
        
        return string(ret);
    }

    // function reverse(string memory _input) internal pure returns (string memory){
    //     bytes memory ret = bytes(_input);

    //     for (uint256 i = ret.length; i > 0; i--) {
    //         ret[ret.length -i] = ret[i-1];
    //     }
        
    //     return string(ret);
    // }



}

// contract TestReverse{
//     function test() public pure returns (string memory) {
//         string memory input = "abcde";
//         return ReverseString().Reverse(input);
//     }
// }