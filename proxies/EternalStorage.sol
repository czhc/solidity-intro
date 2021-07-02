//SPDX-License-Identifier: MIT

pragma solidity 0.8.1;

// EternalStorage serves as the storage/database, Ballot is the Logic / upgradeable layer
// Storage contracts should do the bare-minimum in handling native data structures
// use libraries to add logic/pre/post-processing onto Stoage contracts
// Logic contracts can be upgraded as long as constructor always accepts address of Storage contract

contract EternalStorage {
    mapping(bytes32 => uint) UIntStorage;
    function getUIntValue(bytes32 record) public view returns (uint){
        return UIntStorage[record];
    }
    function setUIntValue(bytes32 record, uint value) public {
        UIntStorage[record] = value;
    }

    mapping(bytes32 => bool) BooleanStorage;
    function getBoolValue(bytes32 record) public view returns (bool){
        return BooleanStorage[record];
    }

    function setBoolValue(bytes32 record, bool value) public {
        BooleanStorage[record] = value;
    }

}

library ballotLib {
    function getNumberOfVotes(address _storage) public view returns (uint256){
        return EternalStorage(_storage).getUIntValue(keccak256('votes'));
    }

    function getUserHasVoted(address _storage) public view returns(bool){
        return EternalStorage(_storage).getBoolValue(keccak256(abi.encodePacked('voted', msg.sender)));
    }

    function setVoteCount(address _storage, uint _voteCount) public {
        EternalStorage(_storage).setUIntValue(keccak256('votes'), _voteCount);
    }

    function setUserHasVoted(address _storage) public {
        EternalStorage(_storage).setBoolValue(keccak256(abi.encodePacked('voted', msg.sender)), true);
    }

}

contract Ballot {
    using ballotLib for address;
    address eternalStorage;

    constructor(address _eternalStorage) {
        eternalStorage = _eternalStorage;
    }

    function getNumberOfVotes() public view returns(uint){
        return eternalStorage.getNumberOfVotes();
    }

    function vote() public {
        require(eternalStorage.getUserHasVoted() == false, 'ERR_USER_ALREADY_VOTED');
        eternalStorage.setUserHasVoted();
        eternalStorage.setVoteCount(eternalStorage.getNumberOfVotes() +1);
    }
}


