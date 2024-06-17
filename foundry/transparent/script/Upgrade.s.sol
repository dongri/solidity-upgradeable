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

        address transparentProxy = 0xa092F2a1B79e4c033021e9bD067464042DCAE97b;

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
