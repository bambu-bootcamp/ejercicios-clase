// Contrato de Farming
pragma solidity ^0.8.0;

contract FarmingContract {
    mapping(address => uint) public stakedBalances;
    mapping(address => uint) public rewards;

    function stake(uint _amount) public {
        // Transfiere tokens al contrato y recibe tokens LP (liquidity provider)
        // Registra el monto staked del usuario
    }

    function unstake(uint _amount) public {
        // Transfiere tokens LP de vuelta al contrato y recibe tokens de recompensa
        // Calcula y otorga recompensas al usuario
    }
}
