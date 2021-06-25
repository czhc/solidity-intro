//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MappingsStructExample {
    struct Payment {
        uint amount;
        uint timestamp;
    }
    
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public accountBalances;
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendMoney() public payable {
        accountBalances[msg.sender].totalBalance += msg.value;
        Payment memory payment = Payment(msg.value, block.timestamp);
        accountBalances[msg.sender].payments[accountBalances[msg.sender].numPayments] = payment;
        accountBalances[msg.sender].numPayments++;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(accountBalances[msg.sender].totalBalance >= _amount, "broke-ass btch");
        accountBalances[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(accountBalances[msg.sender].totalBalance > 0, "broke-ass btch");
        uint balanceToSend = accountBalances[msg.sender].totalBalance;
        accountBalances[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }
    
    function getBalanceStruct() public view returns (uint _totalBalance, uint _numPayments) {
        return (accountBalances[msg.sender].totalBalance, accountBalances[msg.sender].numPayments);
    }
    
}

