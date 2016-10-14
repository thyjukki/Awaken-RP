// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*
	@file Version: 1.0
	@file Name: hud.hpp
	@file Author: [404] Deadbeat, [KoS] Bewilderbeest
	@file Created: 11/09/2012 04:23
	@file Args:
*/

#define hud_food_border_idc 3600
#define hud_blood_border_idc 3601
#define hud_thirst_border_idc 3602
#define hud_food_inside_idc 3603
#define hud_blood_inside_idc 3604
#define hud_thirst_inside_idc 3605
class RscPictureGUI
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.38,0.63,0.26,0.75};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	style = "0x30 + 0x100";
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};

class ARP_DeathScreen {
	idd = -1;
	movingEnable = "false";
	duration = 120;
	fadein = 0;
	name = "DeathScreen";
	controls[] = {"DeathScreen"};
	class DeathScreen: RscPicture {
		x = 0 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 1 * safezoneW;
		h = 1 * safezoneH;
		text = "\z\addons\dayz_code\gui\deathscreen.paa";
	};
};

class ARP_LoadScreen {
	idd = -1;
	movingEnable = "false";
	duration = 120;
	fadein = 0;
	name = "LoadingScreen";
	controls[] = {"LoadingScreen"};
	class LoadingScreen: RscPicture {
		x = 0 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 1 * safezoneW;
		h = 1 * safezoneH;
		text = "mapConfig\loadingscreen.jpg";
	};
};

class WastelandHud {
	idd = -1;
	fadeout=0;
	fadein=0;
	duration = 1e10;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";

	class ControlsBackground {
		class WastelandHud_FoodBG: RscPictureGUI
		{
			idc = -1;
			text = "client\icons\status\status_bg.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;//2
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_FoodBorder: RscPictureGUI
		{
			idc = hud_food_border_idc;
			text = "client\icons\status\status_food_border_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;//2
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_BloodBG: RscPictureGUI
		{
			idc = -1;
			text = "client\icons\status\status_bg.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.79 * safezoneH + safezoneY; //3
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_BloodBorder: RscPictureGUI
		{
			idc = hud_blood_border_idc;
			//text = "client\icons\status\status_blood_border_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.79 * safezoneH + safezoneY; //3
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_ThirstBG: RscPictureGUI
		{
			idc = -1;
			text = "client\icons\status\status_bg.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY; //1
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_ThirstBorder: RscPictureGUI
		{
			idc = hud_thirst_border_idc;
			text = "client\icons\status\status_thirst_border_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY; //1
			w = 0.075;
			h = 0.10;
		};
	};
	class Controls {
		class WastelandHud_FoodInside: RscPictureGUI
		{
			idc = hud_food_inside_idc;
			//text = "client\icons\status\status_food_inside_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_BloodInside: RscPictureGUI
		{
			idc = hud_blood_inside_idc;
			//text = "client\icons\status\status_blood_inside_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.79 * safezoneH + safezoneY;
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_ThirstInside: RscPictureGUI
		{
			idc = hud_thirst_inside_idc;
			//text = "client\icons\status\status_thirst_inside_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY;
			w = 0.075;
			h = 0.10;
		};
	};
};
