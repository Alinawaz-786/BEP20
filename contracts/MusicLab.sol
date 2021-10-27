// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./MusicNFt.sol";

contract MusicLab is ERC20, ERC20Burnable, Pausable, Ownable {
    //Call the NFT Smart Contract.
    MusicNFt public musicnft;

    constructor(MusicNFt _musicnft) ERC20("MusicLabSmartContract", "MLSC") {
        musicnft = _musicnft;
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = musicnft.ownerOf(tokenId);
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }
    function calculateToken(uint256 _duration) internal view returns (uint256 _rewardToekn)
    {
        uint256 token =  0.1 eth;
        
    }

    // total listing song Duration = _duration
    function claimReward(uint256 _duration) public {
        require(_duration > 0 , "in second time must be greater them zero.");
        require(msg.sender !=  address(0), "invalid address");


    }
}
