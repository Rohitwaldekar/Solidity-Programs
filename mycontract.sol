pragma solidity >=0.4.22 <0.6.0;

interface Regulator{
    
    function checkValue(uint amt) external returns(bool);
    function loan() external returns(bool);
}


contract Bank {
    
    uint private value;
    
    constructor(uint nvalue) public {
        value = nvalue;
    }
    
    function deposite(uint nvalue) public {
        value += nvalue;
    }
    
    function withdraw(uint nvalue) public {
        if (checkBalance(nvalue)){
            value -= nvalue;
        }
    }
    
    function balance() public returns (uint) {
        return value;
    }
    
    //Abstract Method
    //function loan() public returns(bool);
    
    function checkBalance(uint amt) public returns(bool){
        return amt >= value;
    }
    
     function loan() public returns(bool){
        return value > 0;
    }
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
    
}
