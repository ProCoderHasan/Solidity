// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Context.sol";

contract Ownable is Context {
    address private _owner;

    event TransferOwnership(address indexed previousOwner,address indexed newOwner);

    constructor(){
        address msgSender = _msgSender();
        _owner = msgSender;
        emit TransferOwnership(address(0), msgSender);
    }
    function owner()public view returns(address){
        return _owner;
    }
    modifier onlyOwner(){
        require(_owner == _msgSender(),"Ownable: Caller is not the owner");
        _;
    }
    function renounceOwnership()public virtual onlyOwner{
        emit TransferOwnership(_owner, address(0));
        _owner = address(0);
    }
    function ownershipTransferred(address newOwner)public virtual onlyOwner{
        require(newOwner != address(0),"Ownable: Owner is the zero address");
        emit TransferOwnership(_owner, newOwner);
        _owner = newOwner;
    }
}
