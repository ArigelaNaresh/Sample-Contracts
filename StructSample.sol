pragma solidity ^0.4.16;


contract StructSample {
    
    address admin;
    
    struct Member {
        address memberAddress;
        string name;
        uint age;
    }
    
    mapping (address=>Member) memberDetails;
    
    function StructSample () public
    {
        admin = msg.sender;
    }
    
    function addMember(address _memberAddress,uint _age,string _name){
        
        if(admin!=msg.sender){
            revert();
        }
        
        Member memory temp = Member(_memberAddress,_name,_age);
        
        memberDetails[_memberAddress] = temp;
        
    }
    
    function getMember(address _memberAddress) constant returns (uint,string) {
        
        return (memberDetails[_memberAddress].age,memberDetails[_memberAddress].name);
    }
    
    
    function editMember(address _memberAddress,uint _age,string _name) {
        
        if(msg.sender!=_memberAddress){
            revert();
        }
        
        memberDetails[_memberAddress].age = _age;
        memberDetails[_memberAddress].name = _name;
        
    }
    
    function getAdminAddress() constant returns (address){
        return admin;
    }
    
    function changeAdmin(address newAdmin) {
        if(msg.sender!=admin){
            revert();
        }
        
        admin = newAdmin;
    }

}
