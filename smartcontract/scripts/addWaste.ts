import { ethers } from "hardhat";
import { WasteProcessingSystem } from "../typechain";

async function main() {
  // const waste = await ethers.getContract<WasteProcessingSystem>(
  //   "WasteProcessingSystem"
  // );
  const waste = await ethers.deployContract("WasteProcessingSystem");
  await waste.waitForDeployment();
  const wasteCheck = await waste.getAddress();
  console.log(`WasteProcessingSystem address: ${wasteCheck}`)
//   const [admin] = await ethers.getSigners();
//   const addWaste = await waste
//     .connect(admin)
//     .addWastes(
//       1,
//       "Plastik Indomaret",
//       "Plastik",
//       "200 gram",
//       "Indomaret",
//       10,
//       20000,
//       "Kasir Indomaret"
//     );
//   await addWaste.wait();
//   const detailWaste = await waste.WasteRecord(1);
//   console.log("Data Berhasil Ditambahkan!")
//   console.log("Detail Limbah Yang Ingin Disalurkan : ");
//   console.log("Nama Limbah :", detailWaste[1]);
//   console.log("Jenis Limbah :", detailWaste[2]);
//   console.log("Berat Limbah :", detailWaste[3]);
//   console.log("Sumber Limbah :", detailWaste[4]);
//   console.log("Jumlah Limbah :", detailWaste[5].toString());
//   console.log("Biaya Pengelolaan Limbah :", detailWaste[6].toString());
//   console.log("Pihak Yang Menyalurkan Limbah :", detailWaste[7]);
// }
}
main().catch((err) => {
  console.error(err);
  process.exitCode = 1;
});
