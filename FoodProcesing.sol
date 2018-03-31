pragma solidity 0.4.*;

import "Admin1.sol";

contract Admin
{
    address admin;
    
     function Admin() public
    {
        admin=msg.sender;
    }
    
    modifier onlyadmin()
    {
       // Log(admin,"Hello");
        if(msg.sender != admin)
        {
            revert();
        }
        _;
    } 
    
    event Log( address addr,address addr1);
    
     struct CA {
        address addr;
        string name;
    }
    
    mapping (address=> CA) structCA;
    
     
    struct Suplier{
        address addr;
        string name;
    }
    
    mapping (address=> Suplier) structSuplier;
    
     struct Manufaturer{
        address addr;
        string name;
     }
     
    mapping (address=> Manufaturer) structManfact;
    
    struct Customer{
        address addr;
        string name;
    }
    
    mapping (address=> Customer) structCust;
    
    function addCA(address _addr, string _name) onlyadmin public
    {
        Log(admin,msg.sender);
        
        if(structCA[_addr].addr != 0)
        {
            revert();
        }
        
        CA memory tempCA;
        tempCA.addr=_addr;
        tempCA.name=_name;
        
        structCA[_addr]=tempCA;
        
    }
    
    function addSuplier(address _addr,string _name)  onlyadmin public
    {
         Log(admin,msg.sender);
      //  Log(structSuplier[_addr].addr,structSuplier[_addr].name);
        if(structSuplier[_addr].addr!=0)
        {
            revert();
        }
        
        Suplier memory tempSuplier;
        tempSuplier.addr=_addr;
        tempSuplier.name=_name;
        
        structSuplier[_addr]=tempSuplier;
    }
    
    function addManufaturer(address _addr,string _name) onlyadmin public
    {
         Log(admin,msg.sender);
     //    Log(structManfact[_addr].addr,structManfact[_addr].name);
        if(structManfact[_addr].addr!=0)
        {
            revert();
        }
        
        Manufaturer memory tempManfact;
        tempManfact.addr=_addr;
        tempManfact.name=_name;
        
        structManfact[_addr]=tempManfact;
        
    }
   
    function addCustomer(address _addr,string _name) onlyadmin public
    {
         Log(admin,msg.sender);
    //  Log(structCust[_addr].addr,structCust[_addr].name);
      
        if(structCust[_addr].addr!=0)
        {
            revert();
        }
        
        Customer memory tempCust;
        tempCust.addr=_addr;
        tempCust.name=_name;
        
        structCust[_addr]=tempCust;
        
    }
    
}
contract CA is Admin{
   
        function getCA(address _addr) constant returns(string name)
        {
            
            
        }
    }