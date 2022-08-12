var TOCToken = artifacts.require("./TOCToken.sol");

contract("TOCToken", function (accounts) {
  it("sets the total supply uppon deployment", function () {
    return TOCToken.deployed()
      .then(function (instance) {
        tokenInstance = instance;
        return tokenInstance.totalSupply();
      })
      .then(function (totalSupply) {
        assert.equal(
          totalSupply.toNumber(),
          1000000,
          "sets the total supply to 1,000,000"
        );
      });
  });
});
