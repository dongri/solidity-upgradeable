// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {Upgrades} from "@openzeppelin-foundry-upgrades/Upgrades.sol";
import {Options} from "@openzeppelin-foundry-upgrades/Options.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIV_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address initialOwner = 0x9E613B3C1C882B3A5Aa1cd0446DB963dcaF38B68; // deployer address

        Options memory opts;
        opts.unsafeSkipAllChecks = true;

        address proxy = Upgrades.deployUUPSProxy(
            "MyNFT.sol",
            abi.encodeCall(MyNFT.initialize, (initialOwner)),
            opts
        );
        MyNFT instance = MyNFT(proxy);
        console.log("Proxy deployed to %s", address(instance));
        vm.stopBroadcast();
    }
}
