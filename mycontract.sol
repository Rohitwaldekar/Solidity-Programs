pragma solidity >=0.4.22 <0.6.0;

contract MyContract{
    
    string private name;
    uint private age;
    
    function setName(string memory nname)  public {
        name = nname;
    }
    
    function getName() public view returns(string memory) {
        return name;
    }
    
    function setAge(uint nage) public {
        age = nage;
    }
    
    function getAge() public view returns(uint){
        return age;
    }
}
