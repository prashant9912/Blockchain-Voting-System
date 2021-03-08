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
    mapping(address=>bool) public voters; //store account that voted
    uint public candidatesCount;

    function add(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    } 

    function vote(uint _candidateId) public{

        require(!voters[msg.sender]);//check that user is not in the list

        require(_candidateId >0 && _candidateId <= candidatesCount);//check that he/she voting a valid candidate 

        voters[msg.sender] = true;

        candidates[_candidateId].voteCount ++;
        
    }

    constructor () public{
        add("Prashant");
        add("Rahul");
    }

}
