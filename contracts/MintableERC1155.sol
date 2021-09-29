// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contracts 
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

// Libraries
import "@openzeppelin/contracts-upgradeable/utils/StringsUpgradeable.sol";
 

contract MintableERC1155 is ERC1155 {
    constructor() ERC1155("https://example.com/token/1155/metadata/") { }

    function mint(uint256 tokenId, uint256 amount) public {
        _mint(msg.sender, tokenId, amount, "");
    }

    function uri(uint256 tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(super.uri(tokenId), StringsUpgradeable.toString(tokenId)));
    }
}
