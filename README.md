# DegenToken Contract
The DegenToken contract is an ERC20 token smart contract that enables various functionalities for players in the Degen Gaming platform. The contract is designed to provide the following features:

Minting new tokens: The platform owner can create new tokens and distribute them as rewards to players. Only the contract owner has the authority to mint tokens.

Transferring tokens: Players can transfer their tokens to others. They can initiate token transfers to any address by specifying the recipient and the amount of tokens they wish to transfer.

Redeeming tokens: Players can redeem their tokens for items in the in-game store. The contract provides a list of available items that can be redeemed using the corresponding token values.

Checking token balance: Players can check their token balance at any time by calling the checkBalance function. It returns the balance of tokens held by the caller's address.

Burning tokens: Any token holder can burn their own tokens if they are no longer needed. The burnTokens function allows token holders to burn a specific amount of tokens from their own balance.

# Contract Details
SPDX-License-Identifier: MIT
Solidity Version: ^0.8.0

### Executing program

```
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

```


## Authors

Akanksha Teja


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
