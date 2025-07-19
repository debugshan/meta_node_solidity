// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract MessageInfo{

    function getMessageDetail() public payable returns (address, uint){
        return (msg.sender, msg.value);
    }

    function getContractAddress() public view returns (address) {
        return address(this);
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}