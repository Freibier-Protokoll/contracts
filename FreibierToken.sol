// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract FreibierToken is ERC20, Ownable {
    
    constructor() ERC20("Freibier Token", "Freibier") {    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._transfer(from, to, amount);
        mint(from, amount);
    }
}
