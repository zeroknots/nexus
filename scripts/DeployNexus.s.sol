// spdx-license-identifier: agpl-3.0-only
pragma solidity ^0.8.25;

import { SafeSingletonDeployer } from "@rhinestone/depoy-sol/src/DeploySingleton.sol";
import { Script } from "forge-std/Script.sol";
import "forge-std/console2.sol";

abstract contract DeployNexus is Script {
    function deploy(uint256 pKey) public {
        bytes32 salt = 0x00000000000000000000000000000000000000006c22c2c2bc572b01b3ff9c91;
        salt = 0x00000000000000000000000000000000000000006c22c2c2bc572b01b3ff9c91;
        bytes memory bytecode = vm.getCode("./artifacts/Nexus/Nexus.json");
        bytes memory args = abi.encode(address(0x0000000071727De22E5E9d8BAf0edAc6f37da032));
        address smartSession = SafeSingletonDeployer.broadcastDeploy(pKey, bytecode, args, salt);
        console2.log("Nexus Addr: ", smartSession);
    }
}
