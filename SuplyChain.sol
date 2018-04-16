pragma solidity ^0.4.*;
contract foodProcess{
    address admin;
    
    function foodProcess() public {
        admin = msg.sender;
    }
    
    modifier onlyAdmin(){
        if(admin != msg.sender){
            revert();
        }
        _;
    }
    
    
    // ------- CA ----- start
    struct CA{
        string Name;
        address Address;
        bool Active;
    }
    
    mapping(address => CA) ca;
    
    
    
    function CreateCA(address _address, string _name) onlyAdmin public{
        if(keccak256(ca[_address].Name) != keccak256("")){
            revert();
        }
        
        CA memory tempCA;
        tempCA.Name = _name;
        tempCA.Address = _address;
        tempCA.Active = true;
        
        ca[_address] = tempCA;
    }
    
    function updateCA(address _address,string _name,bool _active) onlyAdmin public {
        if(keccak256(ca[_address].Name) == ''){
            revert();
        }
        
        ca[_address].Name = _name;
        
        if(!_active){
            ca[_address].Active = _active;
        }
    }
    
    function getCA(address _address) view onlyAdmin public returns(address,string){
        CA memory tempCA = ca[_address];
        
        return (tempCA.Address,tempCA.Name);
    }
    // ------- CA ----- end
    }