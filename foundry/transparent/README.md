## Create a new project

```bash
$ forge init transparent

$ forge install OpenZeppelin/openzeppelin-contracts-upgradeable@v5.0.2 --no-commit --quiet
$ forge install OpenZeppelin/openzeppelin-foundry-upgrades --no-commit --quiet

$ vim remappings.txt
@openzeppelin/contracts/=lib/openzeppelin-contracts-upgradeable/lib/openzeppelin-contracts/contracts/
@openzeppelin/contracts-upgradeable/=lib/openzeppelin-contracts-upgradeable/contracts/
@openzeppelin-foundry-upgrades/=lib/openzeppelin-foundry-upgrades/src/
forge-std/=lib/forge-std/src/
```

## Deploy
```bash
$ vim foundry.toml
ast = true
ffi = true
build_info = true
extra_output = ["storageLayout"]

$ mv .env.example .env
$ vim .env

$ forge script script/Deploy.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast --legacy

$ forge script script/Upgrade.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast --legacy
```

## Memo
The deployer must be the same as the initial owner.
