//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/access/Ownable.sol';

contract Box is Ownable {
  uint256 private value;

  event ValueChanged(uint256 value);

  function setValue(uint256 _value) public onlyOwner {
    value = _value;
    emit ValueChanged(value);
  }

  function getValue() public view returns (uint256) {
    return value;
  }
}