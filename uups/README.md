# UUPS(Universal Upgradeable Proxy Standard) Proxy

## Crate a new project
```
$ cd uups
$ npx hardhat

$ npm install --save-dev @openzeppelin/hardhat-upgrades @nomicfoundation/hardhat-toolbox
$ npm install @openzeppelin/contracts-upgradeable
```

## Deploy contract
```
$ npx hardhat run scripts/deploy.ts --network sepolia
```

## Upgrade contract
```
$ npx hardhat run scripts/upgrade.ts --network sepolia
```
