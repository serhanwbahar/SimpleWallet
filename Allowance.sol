pragma solidity ^0.6.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0-beta.0/contracts/ownership/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0-beta.0/contracts/math/SafeMath.sol";

contract Allowance is Ownable {
    
    using SafeMath for uint;
    
    event AllowanceChanged(address indexed forWho, address indexed byWhom, uint oldAmount, uint newAmount);
    
    mapping(address => uint) public allowance;

    // Add an allowance for a specific address
    function addAllowance(address who, uint amount) public onlyOwner {
        emit AllowanceChanged(who, msg.sender, allowance[who], amount);
        allowance[who] = amount;
    }

    // Modifier to check if the sender is the owner or has enough allowance
    modifier ownerOrAllowed(uint amount) {
        require(isOwner() || allowance[msg.sender] >= amount, "You are not allowed!");
        _;
    }

    // Reduce the allowance of a specific address
    function reduceAllowance(address who, uint amount) internal {
        emit AllowanceChanged(who, msg.sender, allowance[who], allowance[who].sub(amount));
        allowance[who] = allowance[who].sub(amount);
    }    
    
}
