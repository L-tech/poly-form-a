//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract PolygonAbjNFT is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Polygon Abj NFT", "PABJ") {

    }

    function mint(string memory tokenURI) external returns (uint256) {
        _tokenIds.increment();
        require(balanceOf(msg.sender) == 0, "You already own a token");
        uint newTokenId = _tokenIds.current();

        _safeMint(msg.sender, newTokenId);

        _setTokenURI(newTokenId, tokenURI);

        return newTokenId;


    }

    
}
