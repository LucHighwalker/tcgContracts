const truffleAssert = require("truffle-assertions");

const CardFactory = artifacts.require("CardFactory");

contract("CardFactory", () => {
	it("should create a card and emit event", () => {
		CardFactory.deployed().then(instance => {
      instance.createRandomCard("asdasd");
      assert.equal(1, 2);

			// truffleAssert.eventEmitted(result, "NewCard", ev => {
			// 	assert.equal(1, 2);
			// });
		});
	});
});
