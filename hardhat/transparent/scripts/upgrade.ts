import { ethers, upgrades } from "hardhat";

async function main() {
  const ContractFactory = await ethers.getContractFactory("MyNFT");

  const instance = await upgrades.upgradeProxy("0xdD32D252f6a8B947aEA8a87a41170E14C5db3Fbd", ContractFactory);
  await instance.waitForDeployment();

  console.log(`Proxy upgraded to ${await instance.getAddress()}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
