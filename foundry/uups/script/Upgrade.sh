#!/bin/bash
source .env
forge script script/Upgrade.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast --legacy
