import { ethers } from "hardhat";
import { WasteProcessingSystem } from "../typechain";

async function main() {
  const waste = await ethers.getContract<WasteProcessingSystem>(
    "WasteProcessingSystem"
  );
  // const waste = await ethers.deployContract("WasteProcessingSystem");
  // await waste.waitForDeployment();
  // const wasteCheck = await waste.getAddress();
  // console.log(`WasteProcessingSystem address: ${wasteCheck}`)
  const [admin] = await ethers.getSigners();
  const deleteWaste = await waste.connect(admin).deleteWastes(1);
  await deleteWaste.wait();
  const detailWaste = await waste.WasteRecord(1);
  console.log("Data Berhasil dihapus!");
}
main().catch((err) => {
  console.error(err);
  process.exitCode = 1;
});
