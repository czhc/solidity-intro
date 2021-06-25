// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract IntegerExample {
    uint public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}

contract BooleanExample {
    bool public myBool;
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
}