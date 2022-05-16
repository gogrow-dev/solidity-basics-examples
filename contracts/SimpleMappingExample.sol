//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract SimpleMappingExample {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping (uint => mapping(uint => bool)) uintUintBoolMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function getMapping(uint _index1, uint _index2) public view returns(bool) {
        return uintUintBoolMapping[_index1][_index2];
    }

    function setMapping(uint _index1, uint _index2, bool _bool) public returns(bool) {
        return uintUintBoolMapping[_index1][_index2] = _bool;
    }
}
