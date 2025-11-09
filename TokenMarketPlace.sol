// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";//to console output

contract TokenMarketPlace is Ownable{
    
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
event EtherWithdrawn(address indexed owner, uint256 amount);
event CalculateTokenPrice(uint256 priceToPay);

constructor(address _gldToken) Ownable(msg.sender){
    gldToken = IERC20(_gldToken);
}

function adjustTokenpriceBaseOnDemand() public {
    uint marketDemandRation = buyerCount.mul(1e18).div(sellerCount);
    uint smoothingFactor = 1e18;
    uint adjustedRatio = marketDemandRation.add(smoothingFactor).div(2);
    if(prevAdjustedRatio!=adjustedRatio){
        prevAdjustedRatio=adjustedRatio;
        uint newTokenPrice = tokenPrice.mul(adjustedRatio).div(1e18);
        uint minimumPrice = 2e16;
        if(newTokenPrice<minimumPrice){
            tokenPrice = minimumPrice;
        }
        tokenPrice = newTokenPrice;

    }


}

function buyGLDToken(uint256 _amoutOfToken) public payable {

}

function calculateTokenPrice(uint _amoutOfToken) public returns(uint){

}

function sellGLDToken(uint256 _amountOftoken) public {

}

function withdrawTokens(uint256 _amount) public onlyOwner{

}

function withdrawEther(uint256 _amount) public onlyOwner{

}

}