// Contrato vulnerable al desbordamiento de enteros
pragma solidity ^0.8.0;

contract IntegerOverflowVulnerableContract {
    uint8 public value = 255;

    function increment() public {
        value += 1;
    }
}
