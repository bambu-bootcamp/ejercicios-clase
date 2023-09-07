// Contrato vulnerable al desbordamiento de enteros
pragma solidity ^0.8.0;

contract IntegerOverflowVulnerableContract {
    uint8 public value = 255;

    function increment() public {
        value += 1; //0,1,2,3,4,5,6,7,8,9,10
    }
}
