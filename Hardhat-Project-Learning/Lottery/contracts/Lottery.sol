//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Lottery {
    address public owner;
    address payable[] public players;
    uint public lotteryId;
    mapping (uint => address payable) public lotteryHistory;

    constructor () {
        owner = msg.sender;
        lotteryId = 1;
    }

    function getWinnerByLottery(uint _lotteryId) public view returns(address payable) {
        return lotteryHistory[_lotteryId];
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    function enter() public payable {
        require(msg.value > .01 ether);
        
        // address of player entering lottery
        players.push(payable(msg.sender));
    }

    function getRandomNumber() public view returns (uint) {
        //keccak256 is generate random number
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    function pickWinner() public onlyOwner{
        uint index = getRandomNumber() % players.length; //make sure index stay between 0 and player.length - 1
        players[index].transfer(address(this).balance);

        lotteryHistory[lotteryId] = players[index];
        lotteryId++;
    

        // reset the state of the contract
        players = new address payable[](0);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _; // state that below code only run when the modifier success
    }
}
