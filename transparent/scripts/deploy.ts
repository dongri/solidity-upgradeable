import { ethers, upgrades } from "hardhat";

async function main() {
  const ContractFactory = await ethers.getContractFactory("MyNFT");

  const initialOwner = "0x9D7Fa65552609eDF74417485D80613da5eC09Fe5";

  const instance = await upgrades.deployProxy(ContractFactory, [initialOwner]);
  await instance.waitForDeployment();

  console.log(`Proxy deployed to ${await instance.getAddress()}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
