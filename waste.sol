// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract WasteProcessingSystem {
    address public admin;

    struct Waste {
        uint256 idWaste;
        string nameWaste;
        string typeOfWaste;
        string volumeofWaste;
        string wasteSources;
        uint256 amountOfWaste;
        uint256 cost;
        string people;
    }

    mapping(uint256 => Waste) public WasteRecord;

    // add event for logging
    event addWaste(
        uint256 idWaste,
        string nameWaste,
        string typeOfWaste,
        string volumeofWaste,
        string wasteSources,
        uint256 amountOfWaste,
        uint256 cost,
        string people
    );
    event updateWaste(
        uint256 idWaste,
        string nameWaste,
        string typeOfWaste,
        string volumeofWaste,
        string wasteSources,
        uint256 amountOfWaste,
        uint256 cost,
        string people
    );
    event deleteWaste(uint256 idWaste);

    // validation isAdmin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Hanya admin yang boleh melakukan");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Menambah data Limbah.
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

    // Edit data Limbah berdasarkan ID.
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

    // Menghapus data Limbah berdasarkan ID.
    function deleteWastes(uint256 _idWaste) public onlyAdmin {
        require(WasteRecord[_idWaste].idWaste != 0, "Data Limbah dengan ID tersebut tidak ada");
        delete WasteRecord[_idWaste];
        emit deleteWaste(_idWaste);
    }

    // Melihat data Limbah berdasarkan ID.
    function getWastesByID(uint256 _idWaste) public view returns (Waste memory) {
        require(WasteRecord[_idWaste].idWaste != 0, "Data Limbah dengan ID tersebut tidak ada");
        return WasteRecord[_idWaste];
    }
}
