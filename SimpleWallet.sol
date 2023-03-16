pragma solidity ^0.6.1;

import "./Allowance.sol";

contract SimpleWallet is Allowance {
    
    event MoneySent(address indexed beneficiary, uint amount);
    event MoneyReceived(address indexed from, uint amount);

    // Allows the owner or an allowed user to withdraw money
    function withdrawMoney(address payable to, uint amount) public ownerOrAllowed(amount) {
        require(amount <= address(this).balance, "Not enough funds!");
        
        // Reduce allowance if the sender is not the owner
        if(!isOwner()) {
            reduceAllowance(msg.sender, amount);
        }
        
        emit MoneySent(to, amount);
        to.transfer(amount);
    }
    
    // Override renounceOwnership function to prevent usage
    function renounceOwnership() public override onlyOwner {
        revert("Can't renounce ownership here");
    }

    // Fallback function to receive ether and emit MoneyReceived event
    receive () external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}
