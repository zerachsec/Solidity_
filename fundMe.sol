// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundMe {

    uint256 public minimumUsd = 5e18;

    function fund () public payable {
        require (msg.value > minimumUsd, "didnt send enough eth");
    }
    function getPrice () public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5147eA642CAEF7BD9c1265AadcA78f997AbB9649);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256 (price * 1e10 );
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion () public view returns(uint256) {
        return AggregatorV3Interface(0x5147eA642CAEF7BD9c1265AadcA78f997AbB9649).version();
    }

}
