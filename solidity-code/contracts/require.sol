// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleToken{
    uint256 public maxPerMint = 3;

    function mint(uint256 amount) public{
        require(amount <= maxPerMint, "No more than 3 allowed");
        mint(amount);
    }
}