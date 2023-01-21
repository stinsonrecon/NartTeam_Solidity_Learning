const { expect } = require("chai");
describe("HelloWorld", () => {
    it("should change its name when requested", async () => {
        const HelloWorld = await ethers.getContractFactory("HelloWorld");
        const helloWorld = await HelloWorld.deploy("Hello World");
        await helloWorld.setName("Tien");
        expect(await helloWorld.getGreeting()).to.equal("Hello Tien");
    });
});