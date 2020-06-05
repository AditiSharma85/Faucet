const Migrations = artifacts.require("Faucets");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};