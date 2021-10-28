const { ethers } = require('hardhat')
const hre = require("hardhat");

async function main() {


    
    // const Pizza = await hre.ethers.getContractFactory("MusicNFt");
    // const greeter = await Pizza.deploy();    
    // console.log("Pizza deployed to:", greeter.address);

    const music_lab = await hre.ethers.getContractFactory("MusicLab");
    const deploy_music = await music_lab.deploy("0xb769C49Fc14fc03Dfa6bA4Ab86338a9fdD79655f");
    console.log("Pizza deployed to:", deploy_music.address);

//    if constructor have parameter 
//    const greeter = await Pizza.deploy("0x1e3d62dcd61cbd86fd682028b0f76cfcc8388898","0x1947d91fb44093a3a0dc06c418afd31742240f38");    



    
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });