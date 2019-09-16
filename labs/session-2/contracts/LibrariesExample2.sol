pragma solidity ^0.5.6;

library Set {
    // these data will be stored in the calling contract
    struct Data {
        mapping(uint256 => bool) flags;
    }
    
    function insert(
        Data storage _self,
        uint256 _id
    )
        public
        returns(bool)
    {
        if(_self.flags[_id])
            return false;
        _self.flags[_id] = true;
        return true;
    }
    
    function remove(
        Data storage _self,
        uint256 _id
    )
        public 
        returns(bool)
    {
        if(!_self.flags[_id])
            return false;
        _self.flags[_id] = false;
        return true;
    }
    
    function has(
        Data storage _self,
        uint256 _id
    )
        public
        view
        returns(bool)
    {
        return _self.flags[_id];
    }
}



contract PlayWithSetLibrary {
    using Set for Set.Data;
    Set.Data knownValues;
    
    function register(uint value) public {
        // the library functions can be called without 
        // specific instance of that libary, since 
        // the instance will be this contract
        require(knownValues.insert(value));
    }
}