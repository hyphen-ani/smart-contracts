// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EventExample{

    event NewUserRegistered(address indexed  user, string username);

    struct User{
        string username;
        uint age;
    }

    mapping(address => User) public users;

    function registerUser(string memory _username, uint _age) public {

        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.age = _age;

        emit NewUserRegistered(msg.sender, _username);        
    }


}