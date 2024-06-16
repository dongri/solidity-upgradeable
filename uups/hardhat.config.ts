import { HardhatUserConfig } from "hardhat/config";
import "@openzeppelin/hardhat-upgrades";

const DEPLOYER_PRIVATE_KEY = process.env.MY_DEPLOYER_PRIVATE_KEY;
const INFURA_API_KEY = process.env.MY_DEPLOYER_INFURA_API_KEY;

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.24",
    settings: {
      optimizer: {
        enabled: true,
      },
    },
  },
  networks: {
    "sepolia": {
      url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [`${DEPLOYER_PRIVATE_KEY}`]
    }
  }
};

export default config;
