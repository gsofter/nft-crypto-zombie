pragma solidity >=0.5.0 <0.9.0;

import "./zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint256 _zombieId, uint256 _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];
        uint256 newDna = (myZombie.dna + _targetDna) / dnaModulus;
        _createZombie("NoName", newDna);
    }
}
