// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract structTesting {
    struct Person {
        uint8 age;
        string name;
        Hubbio[] hs;
    }

    struct Hubbio {
        string label;
        string value;
    }

    Person[] public peoples;

    function addPerson(Person calldata p) public {
        peoples.push(p);
    }



}