pragma solidity >=0.6.6;

contract Users{
    
    struct auth{
        address acHash;
        string uType;
        string name;
        string uPass;
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
        container[userName].uPass = pass;
        container[userName].question = que;
        container[userName].answer = ans;
    }
    
    function authenticate(string memory userName, string memory pass) public view returns(address) {
        address s;
        if(keccak256(abi.encodePacked(pass)) == keccak256(abi.encodePacked(container[userName].uPass))) {
            s = container[userName].acHash;
        }
        return s;
    }
    
    function changePass(address acHash, string memory userName, string memory pass) public {
           require(msg.sender == acHash);
        container[userName].uPass = pass;
    }
    
    function forgrtPass(string memory userName, string memory que, string memory ans) public view returns(bool) {
        if(keccak256(abi.encodePacked(que)) == keccak256(abi.encodePacked(container[userName].question)) && 
        keccak256(abi.encodePacked(ans)) == keccak256(abi.encodePacked(container[userName].answer))) {
            return true;
        }
        else
            return false;
    }
    
    function delAuth(address acHash, string memory userName) public {
        require(msg.sender == acHash);
        delete container[userName];
    }
    
}
