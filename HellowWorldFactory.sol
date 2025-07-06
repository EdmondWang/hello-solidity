// SPDX-License-Identifer: MIT

pragma solidity 0.8.24;

import { HelloWorld } from "./test.sol";

contract HelloWordFactory {

    HelloWorld[] hws;

    function createHelloWorld() public returns(HelloWorld) {
        HelloWorld hw = new HelloWorld();
        hws.push(hw);
        return hw;
    }

    function getHelloWorldByIndex(uint256 _index) public view returns(HelloWorld) {
        return hws[_index];
    }

    function callSayHelloFromFactory(uint256 _index, uint256 _id) public view returns(string memory) {
        HelloWorld hw = getHelloWorldByIndex(_index);
        return hw.sayHello(_id);
    }

     function callSetHelloWorldFromFactory(uint256 _index, string memory newString, uint256 _id) public {
        HelloWorld hw = getHelloWorldByIndex(_index);
        hw.setHelloWorld(newString, _id);
    }
}