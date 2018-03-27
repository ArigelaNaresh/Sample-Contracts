pragma solidity ^0.4.16;

contract Coin{
    
    address minter;
    mapping (address => uint) balances;
     
      event Deposited(
        address indexed _from,
        address indexed _to
        
    );
    
    function Coin()
    {
        minter=msg.sender;
    }
    
    function mint (address owner, uint amount)
    {
        if(minter!=msg.sender)
            revert();
        balances[owner]=+amount;
         Deposited(minter, msg.sender);
    }
    
    function send(address reciever,uint amount)
    {
        if(balances[msg.sender] < amount) revert();
        balances[msg.sender]-=amount;
        balances[reciever]+=amount;
        Deposited(minter, msg.sender);
    }
    function fund(address reciever,uint amount) payable returns(bool success) {
       reciever.send(1000000000000000000);
        Deposited(minter, msg.sender);
        
    }
    function getBalance(address addr) constant returns (uint balance)
    {
        return balances[addr];
    }
}