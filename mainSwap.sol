pragma solidity ^0.5.16;

import './BEP20.sol';

contract mainSwap is Ownable{
    
    IBEP20 private _token;
    IBEP20 public mainToken;
    
    constructor(address token) public {
        _token= IBEP20(token);
       mainToken = new TESTTOKEN("exchangeToken",address(this));
    }

event Swapped(uint amount);
    
 function swap(uint _amount) public {
     address from=msg.sender;
     address to= address(this);
     require(_token.decimals()==mainToken.decimals(),"decimals are incorrect, cannot swap");
    _token.transferFrom(from,to,_amount);
    _token._burn(from,_amount);
    mainToken.transfer(from,_amount);
    emit Swapped(_amount);
    }

    

 
    
    
}
