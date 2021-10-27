// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.2;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
// import "@openzeppelin/contracts/security/Pausable.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

// contract MyToken is ERC20, ERC20Burnable, Pausable, Ownable {
//     //Taxes
//     struct Fee {
//         uint256 walletFee;
//         uint256 buybacks;
//         uint256 Liquidity;
//     }

//     enum userType {
//         Sell,
//         Buys
//     }
//     mapping(userType => Fee) public feeMapping;

//     constructor() ERC20("PinkSaleCode", "PSC") {
//         intializeFee();
//         _mint(owner(), 1000000000 * (10**18));
//         _mint(address(this), 1000000000 * (10**18));
//     }

//     function intializeFee() internal {
//         feeMapping[userType.Buys].walletFee = 1;
//         feeMapping[userType.Buys].buybacks = 7;
//         feeMapping[userType.Buys].Liquidity = 2;

//         feeMapping[userType.Sell].walletFee = 2;
//         feeMapping[userType.Sell].buybacks = 3;
//         feeMapping[userType.Sell].Liquidity = 10;
//     }

//     function userTypeFee(userType _type)
//         internal
//         view
//         returns (
//             uint256 walletFee,
//             uint256 buybacks,
//             uint256 Liquidity
//         )
//     {
//         return (
//             feeMapping[_type].walletFee,
//             feeMapping[_type].buybacks,
//             feeMapping[_type].Liquidity
//         );
//     }

//     function processSellTax(uint256 amount)
//         internal
//         returns (uint256 remain_amount)
//     {
//         uint256 walletFee;
//         uint256 buybacks;
//         uint256 Liquidity;
//         (
//             walletFee,
//             buybacks,
//             Liquidity,
//         ) = calculateFee(Type.SELL, msg.sender, amount);
//         processTax(walletFee, buybacks, Liquidity);
//         remain_amount =
//             amount -
//             (walletFee + buybacks + Liquidity );
//         return remain_amount;
//     }

//     function calculateFee(
//         Type trade,
//         bool isWhitelisted,
//         uint256 amount
//     )
//         internal
//         view
//         returns (
//             uint256 walletFee,
//             uint256 buybacks,
//             uint256 lpAmount
//         )
//     {
//         uint256 bnbFee;
//         uint256 lpFee;
//         uint256 distributionFee;
//         uint256 walletFee;
//         if (!isWhitelisted && trade == Type.BUY) {
//             (bnbFee, lpFee, distributionFee, walletFee) = userTypeFee(
//                 userType.NormalBuys
//             );
//         }
//         if (isWhitelisted && trade == Type.BUY) {
//             (bnbFee, lpFee, distributionFee, walletFee) = userTypeFee(
//                 userType.WhiteListedBuys
//             );
//         }
//         if (isWhitelisted && trade == Type.SELL) {
//             (bnbFee, lpFee, distributionFee, walletFee) = userTypeFee(
//                 userType.WhiteListedSell
//             );
//         }
//         if (!isWhitelisted && trade == Type.SELL) {
//             (bnbFee, lpFee, distributionFee, walletFee) = userTypeFee(
//                 userType.NormalSell
//             );
//         }
//         if (isWhitelisted && trade == Type.REF_BUY) {
//             (bnbFee, lpFee, distributionFee, walletFee) = userTypeFee(
//                 userType.WhitelistedBuysRef
//             );
//         }
//         return (
//             (isWhitelisted && trade == Type.REF_BUY)
//                 ? ((bnbFee - 2) * amount) / 100
//                 : (bnbFee * amount) / 100,
//             (isWhitelisted && trade == Type.REF_BUY)
//                 ? ((bnbFee - 10) * amount) / 100
//                 : 0,
//             lpFee.mul(amount).div(100),
//             (distributionFee * amount) / 100,
//             (walletFee * amount) / 100
//         );
//     }
// }
