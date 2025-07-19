// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;



contract bank{
    receive() external payable { }

    function withDrawTransfer() external {
        payable (msg.sender).transfer(1 ether);

    }

    function withDrawSend() external {
        bool success = payable(msg.sender).send(1 ether);
        require(success, "Send failed");
    }

    function withDrawCall() external {
        (bool success, bytes memory data) = payable(msg.sender).call{value: 1 ether}("");
        require(success, "Call failed");
    }

}