// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Upgrades} from "@openzeppelin-foundry-upgrades/Upgrades.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract MyNFTTest is Test {
  MyNFT public instance;

  function setUp() public {
    address initialOwner = vm.addr(1);
    address proxy = Upgrades.deployUUPSProxy(
      "MyNFT.sol",
      abi.encodeCall(MyNFT.initialize, (initialOwner))
    );
    instance = MyNFT(proxy);
  }

  function testName() public view {
    assertEq(instance.name(), "MyNFT");
  }
}
