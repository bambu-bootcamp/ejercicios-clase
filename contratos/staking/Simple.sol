// Contrato de Staking
pragma solidity ^0.8.0;

contract StakingContract {
    mapping(address => uint) public stakedBalances;
    mapping(address => uint) public rewards;

    function stake(uint _amount) public {
        // Transfiere tokens al contrato
        // Registra el monto staked del usuario
    }

    function unstake(uint _amount) public {
        // Transfiere tokens de vuelta al usuario
        // Calcula y otorga recompensas al usuario
    }
}
