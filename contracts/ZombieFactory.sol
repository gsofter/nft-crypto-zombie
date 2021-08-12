pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint256 dnaDigits = 16;
    uint256 danModulus = 10**dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }
}
