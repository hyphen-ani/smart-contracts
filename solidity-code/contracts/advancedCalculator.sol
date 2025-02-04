// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleCalculator{

    uint result;

    function addNumbers(uint x, uint y) internal {
        result = x + y;
    }

    function subtractNum(uint x, uint y) internal  {
        result = x - y;
    }
}

contract AdvancedCalculator is SimpleCalculator{

    function multiply(uint x, uint y) internal {
        result = x * y;
    }

    function divide(uint x, uint y) internal  {
        result = x / y;
    }

    function operationToCal(uint x, uint y, uint8 operation) public {
        if(operation == 1){
            addNumbers(x, y);
        }else if(operation == 2){
            subtractNum(x, y);
        }else if(operation == 3){
            multiply(x, y);
        }else if(operation == 4){
            divide(x, y);
        }else{
            revert("Invalid Operation");
        }
    }

    function getvalue() public view returns(uint){
        return result;
    }


}