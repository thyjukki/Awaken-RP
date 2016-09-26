//	@file Version: 1.1
//	@file Name: rickb_items_init.sqf
//	@file Author: rickb
//	@file Description: rickb items init

private ["_unit","_item"];

if (isdedicated) exitwith {};

//_unit = _this select 0;

handle = [] spawn {    
    fnc_dbl ={
        
        _this spawn {    
            _idc = ctrlIDC (_this select 0);          
            _selectedIndex = _this select 1;         
            _unit = player;
            _item = lbData [_idc, _selectedIndex];

            _isMag = isClass( configFile >> "cfgMagazines" >> _item );
            _isClickAble = false;

            _action = "";
            _consume = false;
            _give = "";

            if (_isMag) then
            {
                _isClickAble = isClass( configFile >> "cfgMagazines" >> _item >> "ItemFunctions");

                if (_isClickAble) then
                {
                    _action = getText ( configFile >> "cfgMagazines" >> _item >> "ItemFunctions" >> "action");
                };
            };

            if (_isClickAble) then
            {
			    _compile = format["['%1'] %2;",_item,_action];

                call (compile _compile);
            };
/*

            //WATER PURIFICATION
            if (_item == "rb_waterpure" AND ("rb_bottledirty" in magazines _unit OR "rb_canteen_dirty" in magazines _unit) ) then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\purification.sqf";};

            //COOK MEAT
            if ( _item == "rb_meat"  AND  inflamed cursortarget  AND _unit distance cursortarget < 3) then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\cookmeat.sqf";};			

            // CRAFT first aid kit
            if (_item == "rb_bandage" OR _item == "rb_bloodbag") then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\craftfirstaid.sqf";};

            // repairwheel
            //if (_item == "rb_TIRE" or _item == "rb_WRENCH") then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\repair_tire.sqf";};

            //ANTIBIOTIC (f. sickness)
            if (_item == "rb_antibiotic") then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\takeAntibiotic.sqf";};

*/
            false
        }
    };      


    while {true} do
    {  
        waituntil {!(isnull (finddisplay 602))};
        sleep 0.1;     

        ((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this call fnc_dbl"];  
        ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", " _this call fnc_dbl"];  
        ((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this call fnc_dbl"];    

        waituntil {isnull (finddisplay 602)};      
    };  

};  