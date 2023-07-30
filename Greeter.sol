// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./IHelloWorld.sol";

contract OtherContract {
    IHelloWorld public helloWorldContract;
    address public helloWorldAddress; // Address of the deployed HelloWorld contract

    constructor() {
        helloWorldAddress = 0xF1219Ff3a8B56a3Efc292Be1214C76167B19943E;
        helloWorldContract = IHelloWorld(helloWorldAddress);
    }

    function callHelloWorld() public view returns (string memory) {
        return helloWorldContract.helloWorld();
    }

    function setGreeting(string memory newText) public {
        helloWorldContract.setText(newText);
    }

    function transferHelloWorldOwnership(address newOwner) public {
        helloWorldContract.transferOwnership(newOwner);
    }
}