// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// comment: this is my first smart contract

// struct
// array
// mapping, kv pair

contract HelloWorld {
    // bool boolVar_1 = true;
    // bool boolVar_2 = false;

    // // 0 ~ (2^8 -1) , 0 - 255
    // uint8 uintVar_1 = 255;
    // uint8 uintVar_2 = 0;

    // // 0 ~ (2^256 - 1)
    // uint256 uintVar_3 = 4294967295;

    // int8 intVar_1 = -128;

    // bytes32 bytesVar = "Hello Worldasd asdadd qewqeadasd";

    // // string is kind of bytes32
    // string strVar = "Hello World";

    // // bytes is kinds of array, store multiple byte 

    // // address
    // address addrVar = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    string strVar = "Hello World";

    struct Info {
        string phrase;
        uint256 id;
        address addr;
    }

    Info[] infos;

    mapping(uint256 id => Info info) infoMapping;

    function sayHello(uint256 _id) public view returns(string memory) {
        // for(uint256 i = 0; i < infos.length; i++) {
        //     if (infos[i].id == _id) {
        //         return addInfo(infos[i].phrase);
        //     }
        // }
        // return addInfo(strVar);
        if (infoMapping[_id].addr == address(0x0)) {
            return addInfo(strVar);
        } else {
            return addInfo(infoMapping[_id].phrase );
        }
        
    }

    function setHelloWorld(string memory newString, uint256 _id) public {

        // msg.sender, msg is 1 of built-in env var, sender to know who send this contract
        Info memory info = Info(newString, _id, msg.sender);
        // infos.push(info);
        infoMapping[_id] = info; 
    } 

    function addInfo(string memory helloWorldStr) internal pure returns(string memory) {
        return string.concat(helloWorldStr, " from edmond's contract ");
    }
}
