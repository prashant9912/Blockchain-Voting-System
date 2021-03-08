pragma solidity ^0.5.0;


contract Election{

    // string public candidate1;
    //     constructor() public{
    //     candidate1 = "Candidate 1";
    // }

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint=>Candidate) public candidates;  //mapping to store Candidates
    uint public candidatesCount;

    function add(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    } 

    constructor () public{
        add("Prashant");
        add("Rahul");
    }

}
