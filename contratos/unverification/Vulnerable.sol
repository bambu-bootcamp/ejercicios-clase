// Contrato vulnerable a llamadas no verificadas a contratos externos
pragma solidity ^0.8.0;

contract VulnerableContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function transfer(address _recipient, uint _amount) public {
        require(msg.sender == owner, "Solo el propietario puede transferir");
        _recipient.call{value: _amount}("");
    }
}
