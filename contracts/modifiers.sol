// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Modifier{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner{
        owner = newOwner; 
    }
}