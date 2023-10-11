// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./WasteStorage.sol";
import "./WasteOperation.sol";

contract WasteProcessingSystem is WasteStorage, WasteOperations {
    constructor() WasteOperations() {
    }
}
