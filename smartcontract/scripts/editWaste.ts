import { ethers } from "hardhat";
import { WasteProcessingSystem } from "../typechain";

async function main() {
  const waste = await ethers.getContract<WasteProcessingSystem>(
    "WasteProcessingSystem"
  );
  const [admin] = await ethers.getSigners();
  const updateWaste = await waste
    .connect(admin)
    .editWastes(
      1,
      "Kotoran Sapi",
      "Limbah Organik",
      "200 Gram",
      "Peternakan Sapi",
      5,
      200000,
      "Petani"
    );
  await updateWaste.wait();
  const detailWaste = await waste.WasteRecord(1);
  console.log("Data Berhasil Diperbarui!");
  console.log("Detail Limbah Yang Ingin Disalurkan : ");
  console.log("Nama Limbah :", detailWaste[1]);
  console.log("Jenis Limbah :", detailWaste[2]);
  console.log("Berat Limbah :", detailWaste[3]);
  console.log("Sumber Limbah :", detailWaste[4]);
  console.log("Jumlah Limbah :", detailWaste[5].toString());
  console.log("Biaya Pengelolaan Limbah :", detailWaste[6].toString());
  console.log("Pihak Yang Menyalurkan Limbah :", detailWaste[7]);
}
main().catch((err) => {
  console.error(err);
  process.exitCode = 1;
});
