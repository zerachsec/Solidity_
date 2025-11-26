// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract simpleStorage {

    uint  myFavouriteNumber;

    struct person {
        uint256 favouriteNumber;
        string name;
    }

    // uint256 public myArray;
    person[] public listOfPeople;

    mapping ( string => uint256 ) public nameToFavNumber;

    function store (uint256 _favNumber) public virtual {
        myFavouriteNumber = _favNumber;
    }

    function retrieve () public view returns(uint256){
        return myFavouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(person(_favouriteNumber,_name));
        nameToFavNumber[_name] = _favouriteNumber;
    }


}
