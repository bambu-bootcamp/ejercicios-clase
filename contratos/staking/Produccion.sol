// Contrato de Staking para Producción
pragma solidity ^0.8.0;

interface IToken {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    // Otras funciones estándar ERC-20
}

contract StakingContract {
    IToken public token;
    address public owner;
    uint public stakingStartTime;
    uint public rewardRate;
    uint public totalStaked;
    mapping(address => uint) public stakedBalances;
    mapping(address => uint) public lastClaimTime;

    constructor(address _tokenAddress, uint _rewardRate) {
        token = IToken(_tokenAddress);
        owner = msg.sender;
        rewardRate = _rewardRate;
        stakingStartTime = block.timestamp;
    }

    function stake(uint _amount) external {
        require(_amount > 0, "El monto de staking debe ser mayor que cero");
        require(token.transferFrom(msg.sender, address(this), _amount), "Fallo al transferir tokens");
        totalStaked += _amount;
        stakedBalances[msg.sender] += _amount;
        lastClaimTime[msg.sender] = block.timestamp;
    }

    function claimRewards() external {
        uint reward = calculateReward(msg.sender);
        require(reward > 0, "No hay recompensas para reclamar");
        require(token.transfer(msg.sender, reward), "Fallo al transferir recompensas");
        lastClaimTime[msg.sender] = block.timestamp;
    }

    function calculateReward(address _user) public view returns (uint) {
        uint timeSinceLastClaim = block.timestamp - lastClaimTime[_user];
        return (stakedBalances[_user] * rewardRate * timeSinceLastClaim) / 1 days;
    }
}
