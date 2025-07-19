const { task } = require("hardhat/config");

require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: "https://sepolia.infura.io/v3/f7ea7786a813427588f9df54a4881d49"+process.env.ALCHEMY_API_KEY,
      accounts: ["0xb4ef02946f5b290f54de6f3acfa1f5ff68c5c55d7c9503ced75f1619e3267469"],
    },
  },  
};

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
}); 
