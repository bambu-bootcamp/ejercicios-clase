// Contrato vulnerable al frontrunning
pragma solidity ^0.8.0;

contract FrontrunningVulnerableContract {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Saldo insuficiente");
        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;
    }
}
