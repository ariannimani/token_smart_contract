const TOCToken = artifacts.require("./TOCToken.sol");

module.exports = function (deployer) {
  deployer.deploy(TOCToken, 1000000);
};
