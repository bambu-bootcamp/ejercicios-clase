// Contrato corregido para evitar el subdesbordamiento de enteros
pragma solidity ^0.8.0;

contract SecureContract {
    uint256 public balance = 0;

    function subtractFromBalance(uint _subAmount) public {
        require(_subAmount <= balance, "Subtraccion excesiva");
        balance -= _subAmount;
    }
}
