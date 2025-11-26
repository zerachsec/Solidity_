// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {simpleStorage} from "./SimpleStorage.sol";

contract storageFactory {

    simpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract () public {
        simpleStorage SimpleStorageContractVariable = new simpleStorage();
        listOfSimpleStorageContracts.push(SimpleStorageContractVariable);
    }

    function sfStore (uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].store (_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }

}   
