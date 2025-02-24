// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Importing the SimpleStorage contract to extend its functionality
import "./SimpleStorage.sol";

// ExtraStorage contract inherits from SimpleStorage
contract ExtraStorage is SimpleStorage {
    
    // Overrides the store function from SimpleStorage
    // Adds 5 to the provided number before storing it
    function store(uint256 _favouriteNumber) public override {
        favouriteNumber = _favouriteNumber + 5;
    }
}
