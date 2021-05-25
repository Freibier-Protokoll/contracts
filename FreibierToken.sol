// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract FreibierToken is ERC20 {
    
    constructor(uint256 initialCap) ERC20("Freibier", "Freibier") {
        _mint(msg.sender, initialCap * 10 ** decimals());
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._transfer(from, to, amount);
        _mint(from, amount);
    }
}
