// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract MappingTest {

        //作为状态变量声明，不能在函数内声明
        mapping(address account => mapping(string => uint256)) public myMapping;

        function setMapping(address addr, string memory account, uint256 amout) public {
            myMapping[addr][account] = amout;
        }

        function getMapping(address user, string memory account) public view returns (uint256){
            return myMapping[user][account];
        }

        function delMapping(address user, string memory account) public {
            delete myMapping[user][account];
        }


}