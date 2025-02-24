// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/// @title Simple Storage Contract
/// @dev This contract allows users to store a favorite number, add people with their favorite numbers, 
///      and retrieve stored values.

contract SimpleStorage {
    /// @notice Stores a single favorite number
    uint256 public favouriteNumber;

    /// @dev Defines a struct to store a person's name and favorite number
    struct People {
        uint256 favouriteNumber;
        string name;
    }

    /// @notice An array to store multiple people and their favorite numbers
    People[] public people;

    /// @notice A mapping to link a person's name to their favorite number for quick lookup
    mapping(string => uint256) public nameToFavouriteNumber;

    /// @notice Stores a given favorite number
    /// @param _favouriteNumber The number to be stored
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    /// @notice Retrieves the stored favorite number
    /// @return The stored favorite number
    function retrive() public view returns (uint256) {
        return favouriteNumber;
    }

    /// @notice Adds a new person to the list with their favorite number
    /// @param _name The name of the person
    /// @param _favouriteNumber The favorite number of the person
    function addNewPerson(string memory _name, uint256 _favouriteNumber) public {
        // Add the person to the array
        people.push(People(_favouriteNumber, _name));

        // Store the favorite number in the mapping for quick retrieval
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
