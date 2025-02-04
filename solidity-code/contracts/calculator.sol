// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Calculator{
    uint public result;

    function add(uint x, uint y) public {
        result = x + y;
    }

    function subtract(uint x, uint y) public{
        result = x - y;
    }

    function multiply(uint x, uint y) public{
        result = x * y;
    }

    function divide(uint x, uint y)  public{
        result = x / y;
    }

    function getResult() view public returns(uint){
        return result;
    }
}