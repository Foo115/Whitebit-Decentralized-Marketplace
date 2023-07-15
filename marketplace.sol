// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol";

contract Marketplace {
    struct Item {
        uint256 id;
        string name;
        uint256 price;
        address seller;
        bool active;
    }

    mapping(uint256 => Item) public items;
    uint256 public itemCount;
    address public tokenAddress;
    IERC20 private token;

    event ItemListed(uint256 indexed itemId, string name, uint256 price, address indexed seller);
    event ItemPurchased(uint256 indexed itemId, string name, uint256 price, address indexed buyer);

    constructor(address _tokenAddress) {
        tokenAddress = 0x053CfAf8bf4f75b0899c603A0cD8EA3AEE331f26;
        token = IERC20(_tokenAddress);
    }

    function listNewItem(string memory _name, uint256 _price) external {
        require(_price > 0, "Price must be greater than zero");

        itemCount++;
        items[itemCount] = Item(itemCount, _name, _price, msg.sender, true);

        emit ItemListed(itemCount, _name, _price, msg.sender);
    }

    function purchaseItem(uint256 _itemId) external {
        require(_itemId > 0 && _itemId <= itemCount, "Invalid item ID");

        Item storage item = items[_itemId];
        require(item.active, "Item is not available for purchase");

        uint256 itemPrice = item.price;
        address itemSeller = item.seller;

        token.transferFrom(msg.sender, itemSeller, itemPrice);

        item.active = false;

        emit ItemPurchased(_itemId, item.name, itemPrice, msg.sender);
    }

    function getItem(uint256 _itemId) external view returns (uint256, string memory, uint256, address, bool) {
        require(_itemId > 0 && _itemId <= itemCount, "Invalid item ID");

        Item storage item = items[_itemId];

        return (item.id, item.name, item.price, item.seller, item.active);
    }
}
