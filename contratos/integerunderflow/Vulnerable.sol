// Contrato vulnerable al subdesbordamiento de enteros
pragma solidity ^0.8.0;

contract IntegerUnderflowVulnerableContract {
    uint256 public balance = 0;

    function subtractFromBalance(uint _subAmount) public {
        require(balance >= _subAmount, "Saldo insuficiente");
        balance -= _subAmount;
    }
}
