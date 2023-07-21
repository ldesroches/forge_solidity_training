//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
}