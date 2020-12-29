pragma solidity >=0.6.6;

contract Users{
    
    struct auth{
        address acHash;
        string uType;
        string name;
        string iPass;
        string oPass;
        string question;
        string answer; 
    }
    mapping(string => auth) container;
    
    function register(string memory userType, string memory name,string memory userName, string memory pass, string memory que, string memory ans, address acHash) public {
            require(keccak256(abi.encodePacked(userType)) != keccak256(abi.encodePacked("")) &&
            keccak256(abi.encodePacked(name)) != keccak256(abi.encodePacked("")) &&
            keccak256(abi.encodePacked(userName)) != keccak256(abi.encodePacked("")) &&
            keccak256(abi.encodePacked(pass)) != keccak256(abi.encodePacked("")) &&
            keccak256(abi.encodePacked(que)) != keccak256(abi.encodePacked("")) &&
            keccak256(abi.encodePacked(ans)) != keccak256(abi.encodePacked("")));
           
        container[userName].acHash = acHash;
        container[userName].uType = userType;
        container[userName].name = name;
        container[userName].iPass = pass;
        container[userName].oPass = pass;
        container[userName].question = que;
        container[userName].answer = ans;
    }
    
    function authenticate(string memory userName, string memory pass) public view returns(address, string memory) {
        require(keccak256(abi.encodePacked(pass)) == keccak256(abi.encodePacked(container[userName].oPass)));
        return (container[userName].acHash, container[userName].iPass);
    }
    
    function changePass(string memory userName, string memory pass) public {
        require(msg.sender == container[userName].acHash);
        container[userName].oPass = pass;
    }
    
    function forgrtPass(string memory userName, string memory que, string memory ans) public view returns(string memory) {
        if(keccak256(abi.encodePacked(que)) == keccak256(abi.encodePacked(container[userName].question)) && 
        keccak256(abi.encodePacked(ans)) == keccak256(abi.encodePacked(container[userName].answer))) {
            return container[userName].oPass;
        }
        else
            return "";
    }
    
    function delUser(string memory userName,string memory pass) public {
        require(keccak256(abi.encodePacked(pass)) == keccak256(abi.encodePacked(container[userName].oPass)));
        delete container[userName];
    }
    
    function checkUser(string memory userName) public view returns(bool){
        if(keccak256(abi.encodePacked(container[userName].name)) != keccak256(abi.encodePacked("")))
            return false;
        else
            return true;
    }
    
    function searchUser(string memory userName) public view returns(string memory, string memory){
        if(keccak256(abi.encodePacked(container[userName].name)) != keccak256(abi.encodePacked("")))
            return (container[userName].uType, container[userName].name);
        else
            revert("User not Available");
    }
    
}

contract Cutomer {

    function replaceBattory() public{
        
    }
    
    function searchNearBy() public{
        
    }
    
    function call() public{
        
    }
    
    function rasieTicket() public{
        
    }
}


contract ServiceProvide {

    function xreplaceBattory() public{
        
    }
    
    function xsearchNearBy() public{
        
    }
    
    function xcall() public{
        
    }
    
    function xrasieTicket() public{
        
    }
}

contract Vendor {

    function xreplaceBattory() public{
        
    }
    
    function xsearchNearBy() public{
        
    }
    
    function xcall() public{
        
    }
    
    function xrasieTicket() public{
        
    }
}

contract Batorry {

    function xreplaceBattory() public{
        
    }
    
    function xsearchNearBy() public{
        
    }
    
    function xcall() public{
        
    }
    
    function xrasieTicket() public{
        
    }
}
