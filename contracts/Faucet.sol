//SPDX-License-Identifier : MIT

pragma solidity >0.5.0 <0.6.0;

contract Faucet{

    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    // give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // check for sufficient funds
        require(address(this).balance >= withdraw_amount, "Faucet: Insufficient balance for withdrawal request");
        require(address(this).balance <= 0.1 ether, "Faucet: Withdrwal value can't be more than 0.1 ether");
        msg.sender.transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

function () external payable {
        emit Deposit(msg.sender, msg.value);
    }
}