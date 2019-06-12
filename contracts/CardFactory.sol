pragma solidity ^0.5.8;

contract CardFactory {

    event NewCard(uint cardId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Card {
        string name;
        uint dna;
    }

    Card[] public cards;

    mapping (uint => address) public cardToOwner;
    mapping (address => uint) ownerCardCount;

    // edit function definition below
    function _createCard(string memory _name, uint _dna) private {
        uint id = cards.push(Card(_name, _dna)) - 1;
        cardToOwner[id] = msg.sender;
        ownerCardCount[msg.sender]++;
        emit NewCard(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomCard(string memory _name) public {
        require(ownerCardCount[msg.sender] == 0, 'Owner card count not zero.');
        uint randDna = _generateRandomDna(_name);
        _createCard(_name, randDna);
    }

}