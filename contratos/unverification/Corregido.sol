// Contrato corregido para evitar llamadas no verificadas a contratos externos
pragma solidity ^0.8.0;

contract SecureContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function transfer(address _recipient, uint _amount) public {
        require(msg.sender == owner, "Solo el propietario puede transferir");
        bool success = payable(_recipient).send(_amount); // Verificar el resultado
        require(success, "La transferencia fallo");
    }
}
