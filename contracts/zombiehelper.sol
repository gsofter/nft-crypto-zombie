pragma solidity >=0.5.0 <0.9.0;

import "./zombiefeeding.sol";

contract ZombieHlper is ZombieFeeding {
    // 1: Define levelUpFee

    modifier aboveLevel(uint256 _level, uint256 _zombieId) {
        require(zombies[_zombieId].level > _level, "Level is not enough");
        _;
    }

    function changeName(uint256 _zombieId, string memory _newName)
        external
        aboveLevel(2, _zombieId)
    {
        require(zombieToOwner[_zombieId] == msg.sender, "Not zombie owner");
        zombies[_zombieId].name = _newName;
    }

    function changeDna(uint256 _zombieId, uint256 _newDna)
        external
        aboveLevel(20, _zombieId)
    {
        require(zombieToOwner[_zombieId] == msg.sender, "Not zombie owner");
        zombies[_zombieId].dna = _newDna;
    }
}
