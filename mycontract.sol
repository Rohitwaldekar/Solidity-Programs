pragma solidity >=0.4.22 <0.6.0;

contract Bank {
    
    uint private value;
    
    constructor(uint nvalue) public {
        value = nvalue;
    }
    
    function deposite(uint nvalue) public {
        value += nvalue;
    }
    
    function withdraw(uint nvalue) public {
        value -= nvalue;
    }
    
    function balance() public returns (uint) {
        return value;
    }
    
    //Abstract Method
    //function loan() public returns(bool);
}

contract MyContract is Bank(10) {
    
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
    
    /*function loan() public returns(bool){
        return true;
    }*/
}
