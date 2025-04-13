// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Reverse is ERC721, ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;
    string uriData = "https://amber-random-wildfowl-566.mypinata.cloud/ipfs/bafkreihwe3zpd7rx5dpoxqnsg47eeih4bcegqfpsdzt7xkvzx5hq6rozzu";
    constructor(address initialOwner)
        ERC721("Reverse", "R1999")
        Ownable(initialOwner)
    {}

    function safeMint(address to, string memory uriData)
        public
        onlyOwner
        returns (uint256)
    {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uriData);
        return tokenId;
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
