// Contrato corregido para evitar la reentrancia
pragma solidity ^0.8.0;

contract SecureContract {
    mapping(address => uint) private userBalances;
    mapping(address => bool) private locked;

    function deposit() public payable {
        userBalances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(userBalances[msg.sender] >= _amount, "Saldo insuficiente");
        require(!locked[msg.sender], "Retiro en progreso");
        
        locked[msg.sender] = true;
        
        // Realizar la transferencia después de bloquear
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "La transferencia fallo");
        
        userBalances[msg.sender] -= _amount;
        locked[msg.sender] = false;
    }
}
