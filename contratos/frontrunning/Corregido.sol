// Contrato corregido para evitar el frontrunning
pragma solidity ^0.8.0;

contract SecureContract {
    mapping(address => uint) public balances;
    mapping(address => uint) public pendingWithdrawals;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        uint availableBalance = balances[msg.sender];
        require(availableBalance >= _amount, "Saldo insuficiente");

        pendingWithdrawals[msg.sender] += _amount; // Registrar la cantidad pendiente de retiro
    }

    function completeWithdrawal() public {
        uint amount = pendingWithdrawals[msg.sender];
        require(amount > 0, "No hay retiros pendientes");

        // Realizar la transferencia después de verificar
        pendingWithdrawals[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
