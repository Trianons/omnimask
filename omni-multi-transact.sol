// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract MultTransaction {
 
  address  payable [] addresses;
  uint256 [] values;


  function addToLists(address payable _address, uint256 _value) public payable {
    addresses.push(_address);
    values.push(_value);
  }


  function sendEther(address payable recipient, uint256 amount) public payable {
    require(msg.sender.balance>=amount, "You need more ethers");


    recipient.transfer(amount);
  }


  function MultipleTransact() public payable returns(bool){
    uint256 totalCost = 0;
    for (uint256 i = 0; i < values.length; i++) {
      totalCost += values[i];
    }
    require(msg.sender.balance>totalCost, "The totalCost of the operation is equal or superior of your wallet balance. Add more funds");
    require(values.length == addresses.length, "The number of addresses and values must be the same");
    for (uint256 i = 0; i < addresses.length; i++) {
      sendEther(addresses[i], values[i]);
    }
    return true;
  }




  function getList() public view returns(address payable [] memory, uint256 []memory) {
      return (addresses, values);
  }


}
