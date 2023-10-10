// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract WasteStorage {
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

    modifier onlyAdmin() {
        require(msg.sender == admin, "Hanya admin yang boleh melakukan");
        _;
    }
}
