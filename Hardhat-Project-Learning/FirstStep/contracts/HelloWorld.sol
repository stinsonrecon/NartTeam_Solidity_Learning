// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract HelloWorld {
    string public name;
    string public hello = "Hello ";

    constructor (string memory _name) {
        name = _name;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function getGreeting() public view returns (string memory) {
        return string(abi.encodePacked(hello, name));
    }
}