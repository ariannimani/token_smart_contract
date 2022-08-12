// SPDX-License-Identifier: MIT

pragma solidity >=0.4.2;

contract TOCToken {
    //Token Name
    string public name = "The Open Chain";
    //Token Symbol
    string public symbol = "TOC";
    //Token Standard
    string public standard = "TOC Token v1.0";
    uint256 public totalSupply;
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

     event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
    // Read balance of address
    mapping(address => uint256) public balanceOf;
        mapping(address => mapping(address => uint256)) public allowance;


    //Constructor
    constructor(uint256 _initialSupply) {
        //Set total supply to admin address
        balanceOf[msg.sender] = _initialSupply;
        //Set the total number of tokens
        totalSupply = _initialSupply;
    }

    //Transfer
    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        //Exception if not enough tokens
        require(balanceOf[msg.sender] >= _value);
        //TransferBalance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        //Transfer Event
        emit Transfer(msg.sender, _to, _value);
        //Return a boolean

                return true;


    }
 function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
}

