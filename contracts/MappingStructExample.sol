//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MappingsStructExample {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPaymentsReceived;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public balances;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;

        Payment memory payment = Payment(msg.value, block.timestamp);
        balances[msg.sender].payments[balances[msg.sender].numPaymentsReceived] = payment;
        balances[msg.sender].numPaymentsReceived++;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balances[msg.sender].totalBalance, "not enough funds.");
        
        balances[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public {    
        uint balanceToSend = balances[msg.sender].totalBalance;
        balances[msg.sender].totalBalance = 0;

        _to.transfer(balanceToSend);
    }
}
