const Migrations = artifacts.require("Migrations");
const ZombieFactory = artifacts.require("ZombieFactory");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(ZombieFactory);
};
