// Contrato vulnerable a reentrancia
pragma solidity ^0.8.0;

contract VulnerableContract {
    mapping(address => uint) private userBalances;

    function deposit() public payable {
        userBalances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(userBalances[msg.sender] >= _amount, "Saldo insuficiente");
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "La transferencia fallo");
        userBalances[msg.sender] -= _amount;
    }
}
