// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";//to console output

contract TokenMarketPlace is Ownable(msg.sender){
    
using SafeERC20 for IERC20;
using SafeMath for uint256;   //x.add(y) = x+y

uint256 public tokenPrice = 2e16 wei; // 0.02 ether per GLD token //2 * 10^16 
//10 * 0.02 = 0.2 ether

uint256 public sellerCount = 1;
uint256 public buyerCount=1;
uint public prevAdjustedRatio;
IERC20 public gldToken;

event TokenPriceUpdated(uint256 newPrice);
event TokenBought(address indexed buyer, uint256 amount, uint256 totalCost);
event TokenSold(address indexed seller, uint256 amount, uint256 totalEarned);
event TokensWithdrawn(address indexed owner, uint256 amount);

}