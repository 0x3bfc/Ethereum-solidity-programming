pragma solidity ^0.5.6;


// ownable contract 
contract Ownable {
    address payable owner;
    
    event Killed(address _contract);
    
    modifier onlyOwner(){
        require(
            owner == msg.sender,
            'Invalid owner'
        );
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function kill() 
        public
        onlyOwner
    {
        emit Killed(address(this));
        // selfdestruct(address) sends all of the contract's current balance to address.
        // the SELFDESTRUCT opcode uses negative gas because the operation frees up 
        // space on the blockchain by clearing all of the contract's data.
        selfdestruct(owner);
    }
}

// Base1 contract 
contract Base1 is Ownable {
    
}

// Base2 contract
contract Base2 {
    event Killed (string _contract);
    function kill() public {
        emit Killed('Base2');
    }
}

// Base3 contract
contract Base3 is Base1, Base2 {
    
}

// Final contract 
contract Final is Base3 {
    function kill() public {
        super.kill();
    }
}