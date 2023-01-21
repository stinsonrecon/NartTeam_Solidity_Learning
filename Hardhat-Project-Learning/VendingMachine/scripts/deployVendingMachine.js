const { ethers } = require("hardhat");

async function main() {
    const VendingMachine = await ethers.getContractFactory("VendingMachine");
    const vendingMachine = await VendingMachine.deploy("Vending Machine");
    console.log("Vending Machine Deployed to: ", vendingMachine.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });