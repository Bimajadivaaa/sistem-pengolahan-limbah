import { DeployFunction } from "hardhat-deploy/dist/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";

const func:DeployFunction = async ({
  deployments,
  ethers
}: HardhatRuntimeEnvironment) => {
  const {deploy} = deployments;
  const accounts = await ethers.getSigners();
  
  const deployer = accounts[0];
  console.log("Admin deployed at", deployer.address);

  const WasteProcessingSystem = await deploy('WasteProcessingSystem', {
    contract : 'WasteProcessingSystem',
    from: deployer.address,
    args: [],
    gasLimit: 4000000,
  });
  console.log("WasteProcessingSystem deployed at", WasteProcessingSystem.address);
};
func.tags = ['WasteProcessingSystem']
export default func;