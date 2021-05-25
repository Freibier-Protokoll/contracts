// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FreibierToken is ERC20Capped, Ownable {
    
    constructor(uint256 initialBalance, uint256 cap) ERC20("Freibier Token", "Freibier") ERC20Capped(cap * 10 ** decimals()) {
        require(initialBalance <= cap, "CommonERC20: cap exceeded"); // this is needed to know for sure the cap is not exceded.
        ERC20._mint(msg.sender, initialBalance * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
}