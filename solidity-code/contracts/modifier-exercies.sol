// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PausableToken{
    address public owner;
    bool public paused;
    mapping (address => uint) public balances;

    constructor(){
        owner = msg.sender;
        paused = false;
        balances[owner] = 1000;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function pause() public onlyOwner{
        paused = true;
    }
}