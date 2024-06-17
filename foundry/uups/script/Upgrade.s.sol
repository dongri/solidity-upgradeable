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

        address transparentProxy = 0xd18C46F5C3babC6D6Cd074f48E0114db3e1FCe7e;

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
