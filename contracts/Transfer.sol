pragma solidity >=0.4.21 <8.10.0;

contract Transfer {
    address public owner;
    string public name= "Rahul";

    constructor() public{
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwner(address newOwner, string memory _name) public onlyOwner returns (bool) {
        name = _name;
        owner = newOwner;
        return true;
    }
}