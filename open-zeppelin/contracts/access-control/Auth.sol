//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auth {
  address private admin;

  constructor(){
    admin = msg.sender;
  }

  function isAdmin(address _address) public view returns (bool) {
    return _address == admin;
  }
}