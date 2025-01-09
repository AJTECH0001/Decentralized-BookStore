// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract AdvancedBookStore is BookStore {
    mapping(uint256 => bool) public bestsellers;

    event BookMarkedAsBestseller(uint256 indexed bookId);

    function markAsBestseller(uint256 _bookId) public onlyOwner {
        require(books[_bookId].price != 0, "Book does not exist.");
        bestsellers[_bookId] = true;
        emit BookMarkedAsBestseller(_bookId);
    }
}