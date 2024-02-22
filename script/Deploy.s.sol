// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import {Script, console} from "forge-std/Script.sol";

import {CowAmmModuleFactory} from "src/CowAmmModule.sol";

contract Deploy is Script {
    address internal constant _SETTLER = 0x9008D19f58AAbD9eD0D60971565AA8510560ab41;
    address internal constant _EXTENSIBLE_FALLBACK_HANDLER = 0x2f55e8b20D0B9FEFA187AA7d00B6Cbe563605bF5;
    address internal constant _COMPOSABLE_COW = 0xfdaFc9d1902f4e0b84f65F49f244b32b31013b74;
    address internal _ammHandler;

    constructor() {
        _ammHandler = vm.envAddress("AMM_HANDLER");
    }

    function run() public {
        vm.broadcast();
        console.log("Deploying contract");
        new CowAmmModuleFactory(_SETTLER, _EXTENSIBLE_FALLBACK_HANDLER, _COMPOSABLE_COW, _ammHandler);
    }
}
