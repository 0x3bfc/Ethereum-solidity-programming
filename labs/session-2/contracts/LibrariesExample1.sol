pragma solidity ^0.5.6;

// The library code is resuable using `delegatecall` low level calldata
// Libraries can be called directly without (delegatecall) 
// if their functions are stateless ({ view | pure} functions)
library Triangle {
    function area(uint256 b, uint256 h) public pure returns (uint256) {
        if(b== 0 || h ==0)
            return 0;
        return (b * h)/2;
    }
}


contract MyTriangle {
    function calculateTriangleArea(uint256 b, uint256 h) 
        public
        pure
        returns(uint256)
    {
        return Triangle.area(b, h);
    }
}