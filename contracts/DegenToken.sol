// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(recipient != address(0), "ERC20: transfer to the zero address is not allowed");
        super.transfer(recipient, amount);
        return true;
    }

    function gameStore() public pure returns(string memory) {
            return "1. ProPlayer NFT value = 200 \n 2. SuperNinja value = 100 /n 3. DegenCap value = 75";
        }

    function redeem(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens");
        _burn(msg.sender, amount);
        // Perform additional logic for redeeming in-game items
    }
    function checkBalance() external view returns(uint){
           return balanceOf(msg.sender);
    }
}
