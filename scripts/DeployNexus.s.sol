// spdx-license-identifier: agpl-3.0-only
pragma solidity ^0.8.25;

import { SafeSingletonDeployer } from "@rhinestone/depoy-sol/src/DeploySingleton.sol";
import { ModuleDeployer } from "@rhinestone/depoy-sol/src/DeployModule.sol";
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

        salt = 0x0000000000000000000000000000000000000000915f0b80d190430065114a56;
        bytecode = vm.getCode("./artifacts/K1Validator/K1Validator.json");
        address k1validator = ModuleDeployer.broadcastDeploy(pKey, bytecode, salt);
        console2.log("NexusBootstrap Addr: ", k1validator);


        salt = 0x0000000000000000000000000000000000000000915f0b80d190430065114a56;
        bytecode = vm.getCode("./artifacts/NexusBootstrap/NexusBootstrap.json");
        address bootstrap = SafeSingletonDeployer.broadcastDeploy(pKey, bytecode, salt);
        console2.log("NexusBootstrap Addr: ", bootstrap);

        salt = 0x0000000000000000000000000000000000000000dc511933e067b10016697695;
        bytecode = vm.getCode("./artifacts/K1ValidatorFactory/K1ValidatorFactory.json");
        args = abi.encode(address(0x0000000000781492f9942b873C29635420c31e7f),
                         address(0x129443cA2a9Dec2020808a2868b38dDA457eaCC7),
                         address(0x000000000EE7335c268e8225fcce3E913B8b30FE),
                         address(0x670f03F975409d8ad76Bd489f1F59D2f0441BE5a),
                         address(0x000000000069E2a187AEFFb852bF3cCdC95151B2))
                         ;
        address k1ValidatorFactory = SafeSingletonDeployer.broadcastDeploy(pKey, bytecode, args, salt);
        console2.log("K1ValidatorFactory Addr: ", k1ValidatorFactory);

    }
}
