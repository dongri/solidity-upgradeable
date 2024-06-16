import { ethers, upgrades } from "hardhat";

async function main() {
  const ContractFactory = await ethers.getContractFactory("MyNFT");

  const instance = await upgrades.upgradeProxy("0x202A377B3F818cE206a69a92E09994a0172f5CBf", ContractFactory);
  await instance.waitForDeployment();

  console.log(`Proxy upgraded to ${await instance.getAddress()}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
