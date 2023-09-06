// Contrato corregido para evitar el desbordamiento de enteros
pragma solidity ^0.8.0;

contract SecureContract {
    uint8 public value = 255;

    function increment() public {
        require(value < 255, "Valor maximo alcanzado");
        value += 1;
    }
}
