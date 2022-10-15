// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Wallet {
    
    mapping(address => uint) Wallets;


    function getBalance() external view returns(uint) {
        return Wallets[msg.sender];
    }

    function withdrawMoney(address payable _to, uint _amount) external {
        require(_amount <= Wallets[msg.sender], 'Not enought funds');
        Wallets[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    fallback() external {

    }

    receive() external payable {
        Wallets[msg.sender] += msg.value;
    }
}
