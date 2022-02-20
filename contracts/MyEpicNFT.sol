// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIDs;

    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Whoa!");
    }

    function MakeAnEpicNFT() public {
        uint256 newItemID = _tokenIDs.current();
        _safeMint(msg.sender, newItemID);
        _setTokenURI(newItemID, "{'name': 'Spongebob Cowboy Pants','description': 'A silent hero. A watchful protector.','image': 'https://i.imgur.com/v7U019j.png'}");
        console.log("An NFT w/ ID %s has been minted to %s", newItemID, msg.sender);
        _tokenIDs.increment();
    }
}