// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {simpleStorage} from "./SimpleStorage.sol";

contract addFiveStorage is simpleStorage {

    function store (uint256 _favouriteNumber) public override {
        myFavouriteNumber = _favouriteNumber + 5;
    }

}
