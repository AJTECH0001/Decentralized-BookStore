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

mapping(uint256 => Book) public books;

address public owner;
uint256 private bookId;

constructor() {
    owner = msg.sender;
}

modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can perform this action.");
    _;
}

event BookAdded(uint256 indexed bookId, string title, string author, uint256 price, uint256 stock);
event PurchaseInitiated(uint256 indexed bookId, address indexed buyer, uint256 quantity);

function addBook(string memory title, string memory author, uint256 price, uint256 stock) public onlyOwner {
    bookId++;
    books[bookId] = Book(title, author, price, stock, true);
    emit BookAdded(bookId, title, author, price, stock);
}

function purchaseBook(uint256 _bookId, uint256 quantity) public {
    require(books[_bookId].isAvailable, "Book is not available.");
    require(books[_bookId].stock >= quantity, "Insufficient stock.");
    books[_bookId].stock -= quantity;
    emit PurchaseInitiated(_bookId, msg.sender, quantity);
}

function getBook(uint256 _bookId) public view returns (Book memory) {
    return books[_bookId];
}

function getBooks() public view returns (Book[] memory) {
    Book[] memory bookArray = new Book[](bookId);
    for (uint256 i = 1; i <= bookId; i++) {
        bookArray[i-1] = books[i];
    }
    return bookArray;
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
