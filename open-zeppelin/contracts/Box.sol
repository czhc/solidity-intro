//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './access-control/Auth';

contract Box {
  uint256 private value;
  Auth private auth; // instance of Auth

  event ValueChanged(uint256 value);

  constructor(Auth _auth){
    auth = _auth;
  }

  function setValue(uint256 _value) public {
    require(auth.isAdministrator(msg.sender), "Unauthorized");

    value = _value;
    emit ValueChanged(value);
  }

  function getValue() public view returns (uint256) {
    return value;
  }
}