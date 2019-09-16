pragma solidity ^0.5.6;

// Abstract contract can not be compiled
// they can be used as a base contracts
contract MyAbstractContract {
    function foo1() public returns(bool);
    function foo2() public pure returns(bool) {
        return true;
    }
}

// If a contract inherits another abstract contract without
// implementing all non-implemented functions, it will act
// as abstract contract.
contract MySecondAbstractContract is MyAbstractContract {
    function foo3() public view returns(address) {
        return address(this);
    }
    
    function foo1() public returns(bool) {
        return true;
    }
}
