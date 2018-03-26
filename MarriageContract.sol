pragma solidity ^0.4.21;

contract MarriageContract {

    address a;
    address b;
    uint256 till;
    string docHash;

    mapping(address => bool) coupleConfirmations;
    mapping(address => bool) witnesses;

    modifier onlyCouple(){
        require(msg.sender == a || msg.sender == b);
        _;
    }

    function MarriageContract(address _a, address _b, uint256 _till, string _docHash){
        a = _a;
        b = _b;
        till = _till;
        docHash = _docHash;
    }

    function signContract() onlyCouple() {
        coupleConfirmations[msg.sender] = true;
    }

    function signWitness(){
        witnesses[msg.sender] = true;
    }

    function isWitness(address _address) constant returns (bool) {
        return witnesses[_address];
    }

}
