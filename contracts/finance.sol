pragma solidity >=0.4.21 <0.7.0;

contract finance{

    struct Request{
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }
     Request[] public requests;
     uint public minimumcontribution;
     address[] approvers;

     function campaign(uint minimum) public{
        manager = msg.sender;
        minimumcontribution = minimum;
    }
    
    function loan() public payable{
        require(msg.value > minimumcontribution);
        approvers.push(msg.sender);
    }
    function createrequest (string memory description, uint value, address recipient) public{
     Request memory newrequest = Request({
        description: description,
        value: value,
        recipient: recipient,
        complete: false,
        approvalCount : 0
     });
     requests.push(newrequest);
    }
}