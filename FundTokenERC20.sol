//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {FundMe} from "./FundMe.sol";

// FundTokenERC20
// 1. 让 FundMe 的参与者， 基于 mapping 来领取相应数量的通证
// 2. 让 FundMe 的参与者 可以transfer通证
// 3. 让 FundMe 的参与者在领取通证，需要 burn 通证

contract FundTokenERC20 is ERC20 {
    
    FundMe fundMe;

    constructor(address fundMeAddr) ERC20("FundTokenERC20", "FT") {
        fundMe = FundMe(fundMeAddr);
    }

    function mint(uint256 amountToMint) public {
        require(fundMe.fundersToAmount(msg.sender) >= amountToMint, "You cannot mint this amny tokens");
        require(fundMe.getFundSuccess(), "the Fundme is not completed yet");
        _mint(msg.sender, amountToMint);
        fundMe.setFunderToAmount(msg.sender, fundMe.fundersToAmount(msg.sender) - amountToMint);
    }

    function claim(uint256 amountToClaim) public {
        // complete claim
        require(balanceOf(msg.sender) >= amountToClaim, "You dont have enought ERC20 tokens");
        require(fundMe.getFundSuccess(), "the Fundme is not completed yet");
        // burn amountToClaim Tokens
        _burn(msg.sender, amountToClaim);
    }
}
