const MultTransact = artifacts.require('MultTransact');

module.exports = function (deployer) {
  deployer.deploy(MultTransact);
};
