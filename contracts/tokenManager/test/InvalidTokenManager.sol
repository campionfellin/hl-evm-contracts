// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "../interfaces/ITokenManager.sol";
import "../../utils/Ownable.sol";

/**
 * @author highlight.xyz
 * @notice A basic token manager / sample implementation that locks swaps / removals, 
        but doesn't implement supportsInterface
 */
contract InvalidTokenManager is ITokenManager {
    /**
     * @notice See {ITokenManager-canUpdateMetadata}
     */
    function canUpdateMetadata(
        address sender,
        uint256 /* id */,
        bytes calldata /* newTokenUri */
    ) external view override returns (bool) {
        return Ownable(msg.sender).owner() == sender;
    }

    /**
     * @notice See {ITokenManager-canSwap}
     */
    function canSwap(
        address /* sender */,
        uint256 /* id */,
        address /* newTokenManager */
    ) external pure override returns (bool) {
        return false;
    }

    /**
     * @notice See {ITokenManager-canRemoveItself}
     */
    function canRemoveItself(address /* sender */, uint256 /* id */) external pure override returns (bool) {
        return false;
    }
}