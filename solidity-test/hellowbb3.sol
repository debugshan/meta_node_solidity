// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract HelloWorld {
    // string storeMsg;

    // function set(string memory message) public {
    //     storeMsg = message;
    // }

    // function get() public view returns (string memory) {
    //     return storeMsg;
    // }

    //  uint256 public zeroCount = 0;

    // function isEven(uint256 num) private pure returns(bool) {
    //     return (num % 2 == 0);
    // }

    // function addBool() public view returns (string memory) {
    //     if ((zeroCount%2==1 && zeroCount<=4)) return "true"; else return "false";
    // }

    // int public accout = -1 * 2**255;
    // uint public baccout = 1 * 2**256 - 1;

    // bool public falg = false;
    
    // address public addr = address(0x4EBaE9C7A3D);

    // enum Status {
    //     SUCCESS, // Success: True or False
    //     FAILURE  // Failure: Zero
    // }

    // string private hello = "hello";

    // function sayHello (string memory name) public view returns (string memory) {
    //     return sayHello(name);
    
    // }

    // function sayHello2(string memory name) public view returns (string memory) {
    //     return string.concat(hello, name);
    // }

    //状态常量 （存储在 storage => stateDB）
    uint256 public stateVar = 100;
    mapping (address => uint256) public balances;
    uint256[] someStorageArray;

    //常量 编译时确定，存放在字节码中
    uint256 public constant CONSTANT_VAR = 1000;

    //immuutable (部署时确定，在代码区)
    uint256 public immutable IMMUTABLE_VAR;

    //构造函数 部署的时候自动执行
    constructor() {
        IMMUTABLE_VAR = 500;
    }
    struct TempStruct {
        uint256 value;
        string name;
    }

    function claimvar() public view returns (uint256) {
        uint256[] memory memoryArray = new uint256[](3);
    }

    

}
