// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "../utils/Ownable.sol";
import "./InterfaceSupportTokenManager.sol";

/**
 * @author highlight.xyz
 * @notice A basic token manager / sample implementation that locks swaps / removals / metadata updates
 */
contract TotalLockedTokenManager is ITokenManager, InterfaceSupportTokenManager {
    /**
     * @notice See {ITokenManager-canUpdateMetadata}
     */
    function canUpdateMetadata(
        address /* sender */,
        uint256 /* id */,
        bytes calldata /* newTokenUri */
    ) external pure override returns (bool) {
        return false;
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
