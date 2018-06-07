pragma solidity ^0.4.2;

import "./owner.sol";

contract Election is Ownable {
    // Model a Candidate
    struct Elus {
        uint id;
        string name;
        uint voteCount;
    }

    
    mapping(uint => Elus) public elus;
    uint public elusCount;

    function ElectionElus () onlyOwner public {
        require(msg.sender == owner);
        addElus("Candidat1");
        addElus("Candidat2");
        addElus("Candidat3");
        addElus("Candidat4");
    }

    function addElus (string _name) onlyOwner public {
        require(msg.sender == owner);
        elusCount ++;
        elus[elusCount] = Elus(elusCount, _name, 0);
    }
    
    function addVote (uint idElus) public {
        elus[idElus].voteCount ++;
    }
}