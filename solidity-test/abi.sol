// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ABI {

    //1.编码
    function encode(string memory name, uint256 number) public pure returns(bytes memory, bytes memory){
        return (
            abi.encode(name, number),
            abi.encodePacked(name, number)
        );
        
        //将两个变量转为二进制流
    //     string memory binary_name = string(abi.encodePacked(name));
    //     bytes memory dataName= (bytes(binary_name));  //编码后的二进制流
        
    //     bytes memory numberBinaryData = (uint256keccakHashed(number)).toBytes();//将一个uint转为二进制流
        
    //    return ((dataName),numberBinaryData);


    }  
    
    // 3.解码
    function decode(bytes memory data) public pure returns (string memory, uint256 number){
        return abi.decode(data, (string, uint256));
    }

}