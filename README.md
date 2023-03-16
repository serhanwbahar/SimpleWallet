# Simple Wallet & Allowance Smart Contracts

This repository contains two Solidity smart contracts: `SimpleWallet.sol` and `Allowance.sol`. These contracts allow for the creation and management of a simple wallet with allowances for different users.

## SimpleWallet.sol

`SimpleWallet.sol` is a smart contract that inherits from `Allowance.sol`. It allows users to deposit and withdraw ether from the contract. The contract owner can manage allowances for other users, and these users can withdraw ether up to their allowed amount. The contract also prevents the contract owner from renouncing ownership.

### Events

- `MoneySent`: Emitted when ether is withdrawn from the wallet.
- `MoneyReceived`: Emitted when ether is deposited into the wallet.

### Functions

- `withdrawMoney(address payable to, uint amount)`: Allows the owner or an allowed user to withdraw ether from the wallet.
- `renounceOwnership()`: Overridden function to prevent the owner from renouncing ownership.

### Fallback function

- `receive()`: Allows the contract to receive ether and emits the `MoneyReceived` event.

## Allowance.sol

`Allowance.sol` is a smart contract that extends `Ownable.sol` from the OpenZeppelin library. It manages allowances for different users.

### Events

- `AllowanceChanged`: Emitted when an allowance is changed.

### Functions

- `addAllowance(address who, uint amount)`: Allows the contract owner to add an allowance for a specific address.
- `reduceAllowance(address who, uint amount)`: Reduces the allowance of a specific address.

### Modifiers

- `ownerOrAllowed(uint amount)`: Checks if the sender is the owner or has enough allowance.

## Getting Started

To deploy and interact with these smart contracts, you can use popular development tools such as Truffle, Hardhat, or Remix.

## Note

This repo is intended for educational and test purposes and should be used at your own risk.


## License

This project is licensed under the [MIT License](https://opensource.org/license/mit/).
