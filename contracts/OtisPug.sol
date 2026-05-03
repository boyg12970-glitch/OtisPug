// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title OtisPug NFT
 * @dev A unique NFT contract for Otis the Pug
 */
contract OtisPug is ERC721, ERC721URIStorage, Ownable {
    uint256 private tokenCounter;
    string private baseTokenURI;

    event OtisPugMinted(address indexed to, uint256 tokenId, string uri);

    constructor() ERC721("OtisPug", "OTIS") {
        tokenCounter = 0;
    }

    /**
     * @dev Mint a new OtisPug NFT
     * @param to Address to mint to
     * @param tokenURI The metadata URI for the token
     */
    function mintOtisPug(address to, string memory tokenURI) public onlyOwner {
        uint256 tokenId = tokenCounter;
        tokenCounter += 1;

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);

        emit OtisPugMinted(to, tokenId, tokenURI);
    }

    /**
     * @dev Set base URI for all tokens
     * @param newBaseURI The new base URI
     */
    function setBaseURI(string memory newBaseURI) public onlyOwner {
        baseTokenURI = newBaseURI;
    }

    /**
     * @dev Get current token counter
     */
    function getTokenCounter() public view returns (uint256) {
        return tokenCounter;
    }

    // Override functions required by Solidity
    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

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
