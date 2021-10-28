const { ethers } = require('hardhat')
const hre = require("hardhat");

async function main() {
    const pink_sale = await hre.ethers.getContractFactory("PinkSale");
    const pink_sale_deploy = await pink_sale.deploy();
    console.log("Pizza deployed to:", pink_sale_deploy.address);
//    if constructor have parameter 
//    const greeter = await Pizza.deploy("0x1e3d62dcd61cbd86fd682028b0f76cfcc8388898","0x1947d91fb44093a3a0dc06c418afd31742240f38");
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });