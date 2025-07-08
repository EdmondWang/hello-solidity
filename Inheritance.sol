// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

abstract contract Parent {
    uint256 a = 0;

    function add() public virtual {
        a += 10;
    }
}

contract Child is Parent {
    function add() public override {
        a += 100;
    }
}