// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {priceConverter} from "./priceConverter.sol";

contract fundMe {

    using priceConverter for uint256;

    uint256 public constant MINIMUMUSD = 5e18;
    address[] public funders;
    mapping(address funders => uint256 amountFunded) public addressToAmountFunded;
    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function fund () public payable {
        require (msg.value.getConversionRate() > MINIMUMUSD, "didnt send enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw () public onlyOwner{
        for (uint256 fundersIndex = 0; fundersIndex < funders.length; fundersIndex ++){
            address funder = funders[fundersIndex] ;
            addressToAmountFunded [funder] = 0;
        }
        funders = new address[](0);
        (bool callSucess, ) = payable (msg.sender).call{value : address(this).balance} ("");
        require(callSucess,"call failed");
    }

    modifier onlyOwner () {
        require(msg.sender == i_owner, "sender is not a owner");
        _;
    }
    

}
