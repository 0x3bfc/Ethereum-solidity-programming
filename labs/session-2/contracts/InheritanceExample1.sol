pragma solidity ^0.5.6;

contract A {
    
    function f(uint256 _input) public pure returns (uint256 output){
        output = _input;
    }
    
    function f(address _input) public pure returns (address output){
        output = _input;
    }
}

contract B {
    function f(bytes32 _input) public pure returns (bytes32 output){
        output = _input;
    }
}


contract C is A, B {
    
}