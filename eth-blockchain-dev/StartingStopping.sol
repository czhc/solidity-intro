// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
contract StartupStopUpdateExample {
    address public owner; 
    bool public paused;
    
    constructor() {
        owner = msg.sender;
    }
    function sendMoney() public payable {
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(owner == msg.sender, "You cannot withdraw.");
        require(paused == false, "Contract is paused.");
        _to.transfer(address(this).balance);
    }
    
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }
    
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
    
}