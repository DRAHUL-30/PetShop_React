pragma solidity >=0.4.21 <8.10.0;

contract Adoption{
    address[16] public adopters;
    address payable public owner;

    event Transfer(
        address _from,
        uint256 _amount
    );

    constructor() public{
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amt)external {
        require(msg.sender == owner, "only owner can call this method");
        payable(msg.sender).transfer(_amt);
    }

    function getBalance() external view returns (uint){
        return address(this).balance;
    }

    function transferEther() public payable{
        owner.transfer(msg.value);
        emit Transfer(msg.sender,msg.value);
    }

    function adopt(uint petId) public returns (uint) {
        require(petId>=0 && petId<=15);
        adopters[petId] = msg.sender;
        return petId;
    }
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}