// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract FreibierToken is ERC20  {
    
    constructor() ERC20("Freibier", "Freibier") {
        _mint(msg.sender, 1);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        _mint(from, 2*amount);
        super._transfer(from, to, amount);
    }
    
    function decimals() public view override returns (uint8){
        return super.decimals() - 18;
    }
}
