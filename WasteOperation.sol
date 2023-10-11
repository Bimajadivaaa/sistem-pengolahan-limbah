// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "./WasteStorage.sol";

contract WasteOperations is WasteStorage {
    constructor() {
        admin = msg.sender;
    }

    function addWastes(
        uint256 _idWaste,
        string memory _nameWaste,
        string memory _typeOfWaste,
        string memory _volumeofWaste,
        string memory _wasteSources,
        uint256 _amountOfWaste,
        uint256 _cost,
        string memory _people
    ) public onlyAdmin {
        require(WasteRecord[_idWaste].idWaste == 0, "Data Limbah dengan ID tersebut sudah ada");
        require(bytes(_nameWaste).length > 0, "Nama Limbah Tidak Boleh Kosong");
        require(bytes(_typeOfWaste).length > 0, "Jenis Limbah Tidak Boleh Kosong");
        require(bytes(_volumeofWaste).length > 0, "Berat Limbah Tidak Boleh Kosong");
        require(bytes(_wasteSources).length > 0, "Sumber Limbah Tidak Boleh Kosong");
        require(_amountOfWaste > 0, "Jumlah Limbah Tidak Boleh Kosong");
        require(_cost > 0, "Biaya Pengelolaan Limbah Tidak Boleh Kosong");
        require(bytes(_people).length > 0, "Pihak Yang Mengelola Limbah Tidak Boleh Kosong");
        WasteRecord[_idWaste] = Waste(
            _idWaste,
            _nameWaste,
            _typeOfWaste,
            _volumeofWaste,
            _wasteSources,
            _amountOfWaste,
            _cost,
            _people
        );
        emit addWaste(
            _idWaste,
            _nameWaste,
            _typeOfWaste,
            _volumeofWaste,
            _wasteSources,
            _amountOfWaste,
            _cost,
            _people
        );
    }

    function editWastes(
        uint256 _idWaste,
        string memory _nameWaste,
        string memory _typeOfWaste,
        string memory _volumeofWaste,
        string memory _wasteSources,
        uint256 _amountOfWaste,
        uint256 _cost,
        string memory _people
    ) public onlyAdmin {
        Waste storage waste = WasteRecord[_idWaste];
        require(waste.idWaste != 0, "Data Limbah dengan ID tersebut tidak ada");
        require(WasteRecord[_idWaste].idWaste == 0, "Data Limbah dengan ID tersebut sudah ada");
        require(bytes(_nameWaste).length > 0, "Nama Limbah Tidak Boleh Kosong");
        require(bytes(_typeOfWaste).length > 0, "Jenis Limbah Tidak Boleh Kosong");
        require(bytes(_volumeofWaste).length > 0, "Berat Limbah Tidak Boleh Kosong");
        require(bytes(_wasteSources).length > 0, "Sumber Limbah Tidak Boleh Kosong");
        require(_amountOfWaste > 0, "Jumlah Limbah Tidak Boleh Kosong");
        require(_cost > 0, "Biaya Pengelolaan Limbah Tidak Boleh Kosong");
        require(bytes(_people).length > 0, "Pihak Yang Mengelola Limbah Tidak Boleh Kosong");
        waste.nameWaste = _nameWaste;
        waste.typeOfWaste = _typeOfWaste;
        waste.volumeofWaste = _volumeofWaste;
        waste.wasteSources = _wasteSources;
        waste.amountOfWaste = _amountOfWaste;
        waste.cost = _cost;
        waste.people = _people;

        emit updateWaste(
            _idWaste,
            _nameWaste,
            _typeOfWaste,
            _volumeofWaste,
            _wasteSources,
            _amountOfWaste,
            _cost,
            _people
        );
    }
    function deleteWastes(uint256 _idWaste) public onlyAdmin {
        require(WasteRecord[_idWaste].idWaste != 0, "Data Limbah dengan ID tersebut tidak ada");
        require(_idWaste > 0, "Id Limbah Harus Diisi!");
        delete WasteRecord[_idWaste];
        emit deleteWaste(_idWaste);
    }
    function getWastesByID(uint256 _idWaste) public view returns (Waste memory) {
        require(WasteRecord[_idWaste].idWaste != 0, "Data Limbah dengan ID tersebut tidak ada");
        require(_idWaste > 0, "Id Limbah Harus Diisi!");
        return WasteRecord[_idWaste];
    }
}
