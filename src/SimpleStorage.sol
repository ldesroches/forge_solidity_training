// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// forge commands
// init: forge init
// compile: forge compile
// local blockchain: anvil
// deploy: forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
// send: cast send 0x0e5858864397783DB124b96Bb2F5E7812931a878 "store(uint256)" 123 --rpc-url $GANACHE_RPC_URL --private-key $PRIVATE_KEY
// call: cast call 0x0e5858864397783DB124b96Bb2F5E7812931a878 "retrieve()" --rpc-url $GANACHE_RPC_URL --private-key $PRIVATE_KEY
// conversion: cast --to-base 0x000000000000000000000000000000000000000000000000000000000000007b dec