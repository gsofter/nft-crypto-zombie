pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    event NewZombie(uint256 zombieId, string name, uint256 dna);

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }

    Zombie[] public zombies;

    mapping(uint256 => address) public zombieToOwner;

    mapping(address => uint256) public ownerZombieCount;

    function _createZombie(string memory _name, uint256 _dna) internal {
        zombies.push(Zombie(_name, _dna));
        uint256 zombieId = zombies.length - 1;
        zombieToOwner[zombieId] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(zombieId, _name, _dna);
    }

    function _generateRandomData(string memory _str)
        private
        view
        returns (uint256)
    {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint256 randDna = _generateRandomData(_name);
        _createZombie(_name, randDna);
    }
}
