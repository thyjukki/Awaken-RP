// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#define repairMenu_dialog 50010
#define repairMenu_option 50011
#define repairMenu_title 50012

class RepairMenu
{
	idd = repairMenu_dialog;
	movingEnable=1;
	onLoad = "uiNamespace setVariable ['RepairMenu', _this select 0]";

	class controlsBackground {

		class RepairMenu_background: IGUIBack
		{
			idc=-1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0.6};

			x=0.28;
			y=0.10;
			w=0.3505;
			h=0.70;
		};

		class TopBar: IGUIBack
		{
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {A3W_UICOLOR_R, A3W_UICOLOR_G, A3W_UICOLOR_B, 0.8};

			x=0.28;
			y=0.10;
			w=0.3505;
			h=0.05;
		};

		class RepairMenu_Title:w_RscText
		{
			idc=repairMenu_title;
			text="Repair Vehicle";
			x=0.29;
			y=0.108;
			w=0.2;//088;
			h=0.035;
		};
	};

	class controls {

		class RepairMenu_options:w_Rsclist
		{
			onLBDblClick = "[_this] execVM 'client\systems\repairPanel\selectRepair.sqf';";
			idc = repairMenu_option;
			x=0.30;
			y=0.18;
			w=0.31;
			h=0.49;
		};

		class RepairMenu_activate:w_RscButton
		{
			idc=-1;
			text="Close";
			onButtonClick = "closeDialog 0;";
			x=0.345;
			y=0.70;
			w=0.22;
			h=0.071;
		};
	};
};

