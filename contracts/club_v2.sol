pragma solidity ^0.4.17;

contract player {

// basic attributes

	bytes32 public name;
	uint8 public position;
	uint8 public height;
	uint8 public weight;

// ability value setting

	struct Ability{

		uint8 shoot;
		uint8 defense;
		uint8 reaction;
		uint8 strength;
		uint8 speed;

	}

	Ability public ability;

// constructor function 

	function player(

		bytes32 _name, 
		uint8 _position, 
		uint8 _height, 
		uint8 _weight, 

		uint8 _shoot, 
		uint8 _defense,
		uint8 _reaction,
		uint8 _strength,
		uint8 _speed
	)
	public{
		
		name = _name;
		position = _position;
		height = _height;
		weight = _weight;

		ability = Ability({

			shoot : _shoot,
			defense : _defense,
			reaction : _reaction,
			strength : _strength,
			speed : _speed

		});
	}

// chenging the ability value

	function change_shoot(uint8 add_value) {
		ability.shoot = ability.shoot + add_value;
	}

	function change_defense(uint8 add_value) {
		ability.defense = ability.defense + add_value;
	}

	function change_reaction(uint8 add_value) {
		ability.reaction = 	ability.reaction + add_value;
	}

	function change_strength(uint8 add_value) {
		ability.strength = 	ability.strength + add_value;
	}

	function change_speed(uint8 add_value) {
		ability.speed = ability.speed + add_value;
	}

// traning part, we provide 3 plans for the player;

	function traning_plan1() public{

		change_shoot(1);
		change_speed(1);

	}

	function traning_plan2() public{

		change_defense(1);
		change_strength(1);

	}

	function traning_plan3() public{

		change_strength(1);

	}

	function ability_sum() public view returns(uint8)
	{
		return (ability.shoot+ability.defense+ability.reaction+ability.strength+ability.speed);
	}

	function getName () public view returns(bytes32) {
		return name;
	}

	function getPosition () public view returns(uint8) {
		return position;
	}

	function getHeight () public view returns(uint8) {
		return height;
	}

	function getWeight () public view returns(uint8) {
		return weight;
	}

	function getAbility() public view returns(
		bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
	)
	{
		return(

			name, position, height, weight, 
			ability.shoot, ability.defense, ability.reaction, ability.strength, ability.speed

		);
	}

}

contract team{

	player[10] public player_list;
	player[5] public first_draft;

	function team(player[10] _list, player[5] _draft) public{

		player_list = _list;
		first_draft = _draft;

	}

	function update_draft() public{

		for(uint8 i = 0; i < player_list.length; i++)
		{
			for(uint8 j = 0; j < first_draft.length; j++)
			{
				if(player_list[i].getName() == first_draft[j].getName())
				{
					first_draft[j] == player_list[i];
				}
			}
		}

	}

	function traning_a_player(bytes32 _name, uint _type) public {

		uint8 index = 100;

		for(uint8 i = 0; i < player_list.length;i++)
		{
			if(player_list[i].getName() == _name)
			{
				index = i;
				break;
			}
		}

		if(index != 100)
		{
			if(_type == 1)
			{
				player_list[index].traning_plan1();
			}
			if(_type == 2)
			{
				player_list[index].traning_plan2();
			}
			if(_type == 3)
			{
				player_list[index].traning_plan3();
			}
			update_draft();
		}
	}

// _type 1 == player_list ; _type 2 = first_draft;
	function find_a_player(bytes32 _name, uint8 _type) public returns (player){

		if(_type == 1)
		{
			for(uint8 i = 0; i < player_list.length; i++)
			{
				if(_name == player_list[i].getName())
				{
					return player_list[i];
				}
			}
		}
		if(_type == 2)
		{
			for(uint8 j = 0; j < first_draft.length; j++)
			{
				if(_name == first_draft[j].getName())
				{
					return first_draft[j];
				}
			}
		}

	}

	function team_draft_list() public view returns(bytes32[5]){

		bytes32[5] memory draft_list;

		for(uint8 i = 0; i < first_draft.length; i++)
		{
			draft_list[i] = first_draft[i].getName();
		}

		return draft_list;

	}

// mark here ** cant not return a dynamix array in solidity ------>> need to improve (problem from solidity)

	function team_list() public view returns (bytes32[10]){

		bytes32[10] memory list;

		for(uint8 i = 0; i < player_list.length; i++)
		{
			list[i] = player_list[i].getName();
		}

		return list;

	}

	// function show_first_draft_value(uint index) public view returns(
	// 	bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
	// ){
	// 	return first_draft[index].getAbility();
	// }

	function show_first_draft_value(bytes32 index) public view returns(
		bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
	)
	{
		for(uint8 i = 0; i < first_draft.length; i++)
		{
			if(index == first_draft[i].getName())
			{
				return first_draft[i].getAbility();
			}
		}
	}

	// function show_team_list_value(uint index) public view returns(
	// 	bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
	// ){
	// 	return player_list[index].getAbility();
	// }

	function show_team_list_value(bytes32 index) public view returns(
		bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
	)
	{
		for(uint8 i = 0; i < player_list.length; i++)
		{
			if(index == player_list[i].getName())
			{
				return player_list[i].getAbility();
			}
		}
	}

	function team_ability() view public returns (uint16){

		uint16 TA = 0;
		
		TA = first_draft[0].ability_sum() +
			 first_draft[1].ability_sum() +
			 first_draft[2].ability_sum() +
			 first_draft[3].ability_sum() +
			 first_draft[4].ability_sum();

		return TA;

	}

	function change_draft(bytes32 up, bytes32 down) public returns (bool){

		uint8 up_index = 100;
		uint8 down_index = 100;

		for(uint8 i = 0; i < player_list.length; i++)
		{
			if(up == player_list[i].getName())
			{
				up_index = i;
				break;
			}
		}

		for(uint8 j = 0; j < first_draft.length; j++)
		{
			if(up == first_draft[j].getName())
			{
				down_index = j;
				break;
			}
		}

		if(up_index == 100 || down_index == 100)
		{
			return false;
		}
		else
		{
			player tmp =  first_draft[down_index];
			first_draft[down_index] = player_list[up_index];
			player_list[up_index] = tmp;
			return true;
		}
	}



// 
	// function trade_a_player (bytes32 from , bytes32 to)  public returns(bool){
		
	// 	bool flag = false;

	// 	player p2 = find_a_player(to);

	// 	for(uint i = 0; i < player_list.length; i++)
	// 	{
	// 		if(player_list[i].getName() == from)
	// 		{
	// 			player_list[i] = p2;
	// 			flag = true;

	// 			for(uint j = 0; j < first_draft.length; j++)
	// 			{
	// 				if(from == first_draft[j].getName())
	// 				{
	// 					first_draft[j] = p2;
	// 				}
	// 			}

	// 			break;
	// 		}
	// 	}
	// 	return flag;
	// }

	function trade_a_player (player from , player to)  public returns(bool){
		
		bool flag = false;
		for(uint8 i = 0; i < player_list.length; i++)
		{
			if(player_list[i].getName() == to.getName())
			{
				player_list[i] = from;
				flag = true;

				for(uint8 j = 0; j < first_draft.length; j++)
				{
					if(to.getName() == first_draft[j].getName())
					{
						first_draft[j] = from;
					}
				}

				break;
			}
		}
		return flag;
	}

}

// only support 1 to 1 trade right now

contract trade{

	player[10] public trade_list;

	function trade(player[10] _trade_list) public{

		trade_list = _trade_list;

	}

	function find_a_player(bytes32 _name) public returns (player){

		for(uint8 i = 0; i < trade_list.length; i++)
		{
			if(_name == trade_list[i].getName())
			{
				return trade_list[i];
			}
		}
	}

	function show_trade_list() public view returns(bytes32[10]){

		bytes32[10] memory name_list;

		for(uint8 i = 0; i < trade_list.length; i++)
		{
			name_list[i] = trade_list[i].getName();
		}

		return name_list;

	}

	function show_trade_value(uint8 i) public view returns(
		bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
		){
		return trade_list[i].getAbility();
	}

// 
	function trade_a_player (player from , player to)  public returns(bool){
		
		bool flag = false;
		for(uint8 i = 0; i < trade_list.length; i++)
		{
			if(trade_list[i].getName() == from.getName())
			{
				trade_list[i] = to;
				flag = true;
				break;
			}
		}
		return flag;
	}
	
}

// starting a match

contract macth{

	uint16[10] level = [1300,1400,1500,1600,1700,1800,1900,2000,2100,2200];

	function match_result (uint16 team_value, uint16 AI) public view returns(bool)  {

		if(team_value > level[AI])
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	

}


contract club_control{

	bytes32 public name;
	team public myteam;
	trade public mytrade;
	address public owner;
	macth public mymatch;

	modifier onlyOwner { 

		require (msg.sender == owner);
		_;

	}

	function init_team () public returns(team) {

		player[10] memory player_list;
		player[5] memory lineup_list;

		player player1 = new player("Kobe", 4, 190, 150, 98, 91, 87, 91, 77);
		player player2 = new player("James", 2, 191, 130, 91, 91, 91, 99, 91);
		player player3 = new player("Wade", 3, 188, 130, 87, 77, 98, 88, 88);
		player player4 = new player("Yao", 1, 182, 130, 90, 90, 91, 90, 90);
		player player5 = new player("allen", 5, 184, 130, 90, 87, 90, 77, 77);
		player player6 = new player("KD", 2, 175, 130, 90, 91, 91, 91, 77);
		player player7 = new player("Step", 3, 180, 130, 90, 91, 90, 87, 90);
		player player8 = new player("AK", 2, 199, 130, 90, 90, 87, 91, 90);
		player player9 = new player("McGrady", 1, 188, 130, 77, 90, 77, 91, 77);
		player player10 = new player("Zhou", 1, 180, 130, 90, 87, 90, 77, 90);

		player_list = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10];
		lineup_list = [player1, player2, player3, player4, player5];

		return new team(player_list, lineup_list);
		
	}
	
	function init_trade() public returns(trade) {
		player[10] memory trade_player;

		player player11 = new player("AI", 4, 190, 150, 91, 91, 87, 91, 77);
		player player12 = new player("Tom", 2, 191, 130, 93, 91, 91, 99, 91);
		player player13 = new player("Wang", 3, 188, 130, 87, 77, 98, 88, 88);
		player player14 = new player("Yi", 1, 182, 130, 90, 90, 87, 90, 90);
		player player15 = new player("Ted", 5, 184, 130, 87, 87, 93, 77, 77);
		player player16 = new player("LBJ", 2, 175, 130, 93, 91, 91, 91, 77);
		player player17 = new player("TS", 3, 180, 130, 90, 91, 90, 87, 87);
		player player18 = new player("OI", 2, 199, 130, 90, 90, 87, 91, 87);
		player player19 = new player("Kawa", 1, 188, 130, 77, 93, 77, 91, 77);
		player player20 = new player("Mick", 1, 180, 130, 90, 87, 90, 93, 93);

		trade_player = [player11, player12, player13, player14, player15, player16, player17, player18, player19, player20];

		return new trade(trade_player);

	}

	function club_control(bytes32 _name) public {	

		name = _name;
		myteam = init_team();
		mytrade = init_trade();
	}

	function draft_info_list() public view returns(bytes32[5]){

		return myteam.team_draft_list();

	}
	function team_info_list() public view returns(bytes32[10]){

		return myteam.team_list();

	}

	function draft_info_player(bytes32 index) public view returns(
		bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
		){

			return myteam.show_first_draft_value(index);

	}

	function team_info_player(bytes32 index) public view returns(
		bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
		){

			return myteam.show_team_list_value(index);

	}

	function trade_info_list() public view returns(bytes32[10]){

		return mytrade.show_trade_list();

	}

	function trade_info_player(uint8 index) public view returns(
		bytes32, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8
		){

			return mytrade.show_trade_value(index);

	}

// _type 1,2,3 = traning plan 1,2,3
	function traning(bytes32 _name, uint8 _type){

		myteam.traning_a_player(_name, _type);

	}


	function trading_player(bytes32 from, bytes32 to) public {

		player p1 = mytrade.find_a_player(from);
		player p2 = myteam.find_a_player(to, 1);

		myteam.trade_a_player(p1, p2);
		mytrade.trade_a_player(p1, p2);
		myteam.update_draft();

	}

	function change_list(bytes32 from, bytes32 to)public{

		myteam.change_draft(from, to);

	}

	function play_match(uint16 level) public view returns(bool) {

		uint16 team_value = myteam.team_ability();

		return mymatch.match_result(team_value, level);

	}
}








