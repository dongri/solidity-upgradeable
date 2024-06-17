// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {Upgrades} from "@openzeppelin-foundry-upgrades/Upgrades.sol";
import {Options} from "@openzeppelin-foundry-upgrades/Options.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract UpgradeScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIV_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address transparentProxy = 0x0392de706F30f2b8d533979e091dE7CD947440Bf;

        Options memory opts;
        opts.unsafeSkipAllChecks = true;

        Upgrades.upgradeProxy(
            transparentProxy,
            "MyNFT.sol",
            "",
            opts
        );
        
        console.log("Proxy upgraded to %s", transparentProxy);
        vm.stopBroadcast();
    }
}
