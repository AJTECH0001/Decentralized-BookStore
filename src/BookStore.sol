// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";

contract BookStore is Ownable {

   struct Book {
    string title;
    string author;
    uint price;
    uint256 stock;
    bool isAvailable;
}



modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can perform this action.");
    _;
}

event BookAdded(uint256 indexed bookId, string title, string author, uint256 price, uint256 stock);
event PurchaseInitiated(uint256 indexed bookId, address indexed buyer, address indexed seller, uint256 quantity);

function addBook(string memory title, string memory author, uint256 price, uint256 stock) public onlyOwner {
    bookId++;
    books[bookId] = Book(title, author, price, stock, true);
    emit BookAdded(bookId, title, author, price, stock);
}

function purchaseBook(uint256 bookId, uint256 quantity) public {
    require(books[bookId].isAvailable, "Book is not available.");
    require(books[bookId].stock >= quantity, "Insufficient stock.");
    books[bookId].stock -= quantity;
    emit PurchaseInitiated(bookId, msg.sender, books[bookId].author, quantity);
}

function getBook(uint256 bookId) public view returns (Book memory) {
    return books[bookId];
}

function getBooks() public view returns (Book[] memory) {
    return books;
}

function getBookCount() public view returns (uint256) {
    return bookId;
}

function getOwner() public view returns (address) {
    return owner;
}

function setOwner(address newOwner) public onlyOwner {
    owner = newOwner;
}

}
