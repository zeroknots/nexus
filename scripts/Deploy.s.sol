import "./DeployNexus.s.sol";

contract DeployScript is DeployNexus {
    function run() public {
        uint256 privKey = vm.envUint("PRIVATE_KEY");
        console2.log("Deployer Addr: ", vm.addr(privKey));

        runFork("base");
    }

    function runFork(string memory fork) internal {
      this.tryRunFork(fork);
            console2.log("Error running fork: ", fork);
    }

    function tryRunFork(string memory fork) external {
        uint256 privKey = vm.envUint("PRIVATE_KEY");
        // vm.createSelectFork(fork);
        deploy(privKey);
    }
}
