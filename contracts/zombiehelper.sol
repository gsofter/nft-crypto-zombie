pragma solidity >=0.5.0 <0.9.0;

import "./zombiefeeding.sol";

contract ZombieHlper is ZombieFeeding {
    // 1: Define levelUpFee

    modifier aboveLevel(uint256 _level, uint256 _zombieId) {
        require(zombies[_zombieId].level > _level, "Level is not enough");
        _;
    }
}
