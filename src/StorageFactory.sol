// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Import the SimpleStorage contract to create and manage multiple instances
import "./SimpleStorage.sol";

contract StorageFactory {
    
    // Array to store deployed SimpleStorage contract instances
    SimpleStorage[] public simpleStorageArray;

    /**
     * @dev Creates a new instance of the SimpleStorage contract and stores it in the array.
     */
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); // Deploy a new SimpleStorage contract
        simpleStorageArray.push(simpleStorage); // Store the instance in the array
    }

    /**
     * @dev Calls the `store` function of a specific SimpleStorage contract instance.
     * @param _simpleStorageIndex The index of the contract instance in the array.
     * @param _simpleStorageNumber The number to store in the selected contract.
     */
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    /**
     * @dev Calls the `retrieve` function of a specific SimpleStorage contract instance.
     * @param _simpleStorageIndex The index of the contract instance in the array.
     * @return The stored number in the selected SimpleStorage contract.
     */
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return simpleStorageArray[_simpleStorageIndex].retrive(); // Should be `retrieve()`, check spelling
    }
}
