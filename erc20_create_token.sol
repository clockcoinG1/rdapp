// SPDX-License-Identifier: 0BSD
pragma solidity ^0.8.13;
import "./ERC20.sol";

// create a erc 20 token
contract ERC20CreateToken {
    
    // mapping (address => ERC20)
    mapping(address => ERC20) public tokenList;
    event TokenCreated(address token);

    // constructor

    function ERC20CreateToken() {
        // create a new erc20 token
        ERC20 token = new ERC20(1000);
        // set the token name
        token.setName("fsbk");
        // set the token symbol
        token.setSymbol("FSBK");
        // set the token decimals
        token.setDecimals(18);
        // set the token owner
        token.setOwner(msg.sender);

        // set the token total supply
        token.setTotalSupply(1000);
        // set the token balance of owner
        token.setBalanceOf(msg.sender, 1000);

        // set the token transfer event
        token.setTransferEvent();

        // set the token approve event
        token.setApproveEvent();

        // set the token transferFrom event
        token.setTransferFromEvent();
    }

    // set the token name
    function setName(string _name) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // set the token name
        token.setName(_name);
    }

    // set the token symbol
    function setSymbol(string _symbol) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // set the token symbol
        token.setSymbol(_symbol);
    }

    // send the token
    function send(address _to, uint _value) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // send the token
        token.send(_to, _value);
    }

    // transfer the token
    function transfer(address _to, uint _value) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // transfer the token
        token.transfer(_to, _value);
    }

    // transfer the token from another account
    function transferFrom(address _from, address _to, uint _value) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // transfer the token from another account
        token.transferFrom(_from, _to, _value);
    }

    // admin approve the token
    function approve(address _spender, uint _value) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // admin approve the token
        token.approve(_spender, _value);
    }

    // admin approve the token from another account
    function approveFrom(address _from, address _spender, uint _value) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // admin approve the token from another account
        token.approveFrom(_from, _spender, _value);
    }
    

    // gas used
    function gasUsed() public view returns (uint) {
        return msg.gas;
    }

    // event for token sending
    event TokenSent(address token, address to, uint value);

    // event for token transfer
    event TokenTransferred(address token, address from, address to, uint value);

    // event for token approve
    event TokenApproved(address token, address spender, uint value);

    // event for token transferFrom
    event TokenTransferredFrom(address token, address from, address to, uint value);

    function emitTokenSent(address _token, address _to, uint _value) public {
        emit TokenSent(_token, _to, _value);
    }

    function emitTokenTransferred(address _token, address _from, address _to, uint _value) public {
        emit TokenTransferred(_token, _from, _to, _value);
    }

    function emitTokenApproved(address _token, address _spender, uint _value) public {
        emit TokenApproved(_token, _spender, _value);
    }


    uint public getTokenId() public view returns (uint) {
        return tokenList[msg.sender].getTokenId();
    }

    // send tokens to owner
    function sendToOwner(uint _value) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // send the token to owner
        token.send(token.getOwner(), _value);
    }

    // transfer tokens to owner
    function transferToOwner(uint _value) public {
        // get the token
        ERC20 token = tokenList[msg.sender];
        // transfer the token to owner
        token.transfer(token.getOwner(), _value);
    }

        
}

