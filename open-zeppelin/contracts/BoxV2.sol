//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol';
//import "@openzeppelin/contracts/proxy/utils/Initializeable.sol";

contract BoxV2 is OwnableUpgradeable {
  uint256 private value;

  // any new V2 variables can be added here if needed
  //


  event ValueChanged(uint256 value);

  function initialize() initializer public {
        __Ownable_init();
  }


  function setValue(uint256 _value) public onlyOwner {
    value = _value;
    emit ValueChanged(value);
  }

  function getValue() public view returns (uint256) {
    return value;
  }

  function increment() public {
    value = value + 1;
    emit ValueChanged(value);
  }
}