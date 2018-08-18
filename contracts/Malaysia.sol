pragma solidity ^0.4.23;

contract Malaysia {
    
    address public owner;

    struct State {
        string name;
        string kings_name;
        address[] districtArray;
    }

    mapping (address => State) public states;

    struct District {
        string name;
    }

    mapping (address => District) public districts;

    constructor() public {
        owner = msg.sender;
    }
    
    function addState(address _state_address, string _name, string _kings_name) public {
        // creating a temp struct first
        State memory newState;
        newState.name = _name;
        newState.kings_name = _kings_name;

        // saving struct into the `states` mapping
        states[_state_address] = newState;
    }

    function addDistrict(address _district_address, address _state_address, string _name) public {
        // creating a temp struct first
        District memory newDistrict;
        newDistrict.name = _name;

        // saving struct into the `districts` mapping
        districts[_district_address] = newDistrict;

        State storage _state = states[_state_address];
        _state.districtArray.push(_district_address);
    }

    function getDestrictLength(address _state_address) public view returns (uint256) {
        return states[_state_address].districtArray.length;
    }

    function getDestrict(address _state_address, uint256 _index) public view returns (address) {
        return states[_state_address].districtArray[_index];
    }

}
