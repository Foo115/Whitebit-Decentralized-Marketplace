# Decentralized Marketplace

This repository contains the smart contract code for a decentralized marketplace built on the Ethereum blockchain.

## Introduction

The Decentralized Marketplace allows users to list, buy, and sell items using a native token. It provides a peer-to-peer marketplace environment where users can interact directly without the need for intermediaries.

The project consists of two main contracts:
- `Marketplace.sol`: Implements the core functionality of the decentralized marketplace.
- `IERC20.sol`: An interface representing the ERC20 token standard, used for interacting with the native token in the marketplace.

## Contracts

### Marketplace.sol

The `Marketplace.sol` contract is responsible for managing the marketplace functionality. It includes features such as listing items, purchasing items, and retrieving item details.

Key Features:
- Users can list items for sale by calling the `listNewItem` function.
- Other users can purchase listed items by calling the `purchaseItem` function.
- The `getItem` function allows users to retrieve the details of a specific item.

### IERC20.sol

The `IERC20.sol` interface represents the ERC20 token standard. It defines the required functions and events for interacting with ERC20 tokens. This interface is used to interact with the native token in the marketplace.

## Getting Started

To deploy and interact with the decentralized marketplace contract, follow these steps:

1. Deploy the `Marketplace.sol` contract on the Ethereum network of your choice.
2. Provide the address of the deployed ERC20 token contract to the `Marketplace` contract constructor.
3. Use the marketplace functions to list items, purchase items, and retrieve item details.

## Contributing

Contributions to this decentralized marketplace project are welcome! If you have any ideas, improvements, or bug fixes, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

