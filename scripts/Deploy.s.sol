import "./DeployNexus.s.sol";

contract DeployScript is DeployNexus {
    function run() public {
        uint256 privKey = vm.envUint("PRIVATE_KEY");
        console2.log("Deployer Addr: ", vm.addr(privKey));

        // runFork("base");
        // runFork("arbitrum");
        // runFork("optimism");
        // runFork("optimism-sepolia");
        // runFork("sepolia");
        // runFork("polygon");
        // runFork("polygon-amoy");
        // runFork("gnosis");
        // runFork("bsc");
        // runFork("bsc-testnet");
        // runFork("base");
        // runFork("base-sepolia");


        // runFork("arbitrum-sepolia");
        runFork("avalanche");
    }

    function runFork(string memory fork) internal {
      this.tryRunFork(fork);
            console2.log("Error running fork: ", fork);
    }

    function tryRunFork(string memory fork) external {
        uint256 privKey = vm.envUint("PRIVATE_KEY");
        vm.createSelectFork(fork);
        deploy(privKey);
    }
}
