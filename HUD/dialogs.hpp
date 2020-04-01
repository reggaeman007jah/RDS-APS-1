
class RscTitles
{
 class Default 
    {
       idd = -1;
       fadein = 0;
       fadeout = 0;
       duration = 0;
    };

/*
// DO WE NEED THIS?....?? 
 class H8erHUD
    {
        idd = 1000000;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0.1;
        fadeout      =  2;
        name = "H8erHUD";
		onLoad = "with uiNameSpace do { H8erHUD = _this select 0 }";
	class controls 
        {
		    class structuredText
            {
                access = 0;
                type = 13;
                idc = 1001;
                style = 0x00;
                lineSpacing = 1;
				x = 0.100 * safezoneW + safezoneX;
				y = 0.150 * safezoneH + safezoneY;
				w = 0.250 * safezoneW;
				h = 0.190 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.6};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FFFFFF";
						align = "RIGHT";
						valign = "TOP";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "4";
								}; 
            };
		};
	};
	*/
	// SPEED IN KMH & KNOTTS
	// SPEED IN KMH
	// SPEED IN KNOTTS
	// ALT IN ATL
	// ALT IN ASL
	// VERT SPEED INDICATOR?
    // REDO THE ABOVE!!

// -------------------------------------------------------------------------------- AVIONICS

// ----- SPEED
    
	class SPEEDINKNOTTS
    {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "SPEEDINKNOTTS";
		onLoad = "with uiNameSpace do { SPEEDINKNOTTS = _this select 0 }";
	class controls 
        {
		    class structuredText
            {
                access = 0;
                type = 13;
                idc = 999100;
                style = 0x00;
                lineSpacing = 1;
				x = 0.700 * safezoneW + safezoneX;
				y = 0.500 * safezoneH + safezoneY;
				w = 0.050 * safezoneW;
				h = 0.020 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.6};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FFFFFF";
						align = "CENTER";
						valign = "TOP";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
		};
	};
	
	class SPEEDINKNOTTSVALUE
    {
        idd = 1100003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "SPEEDINKNOTTSVALUE";
		onLoad = "with uiNameSpace do { SPEEDINKNOTTSVALUE = _this select 0 }";
	class controls 
        {
		    class structuredText
            {
                access = 0;
                type = 13;
                idc = 999110;
                style = 0x00;
                lineSpacing = 1;
				x = 0.700 * safezoneW + safezoneX;
				y = 0.520 * safezoneH + safezoneY;
				w = 0.050 * safezoneW;
				h = 0.050 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.6};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FFFFFF";
						align = "CENTER";
						valign = "TOP";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "5";
								}; 
            };
		};
	};
// ----- END OF SPEED

// ----- ALT
	
class ALT
    {
        idd = 10000100;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "ALT";
		onLoad = "with uiNameSpace do { ALT = _this select 0 }";
	class controls 
        {
		    class structuredText
            {
                access = 0;
                type = 13;
                idc = 999120;
                style = 0x00;
                lineSpacing = 1;
				x = 0.475 * safezoneW + safezoneX;
				y = 0.770 * safezoneH + safezoneY;
				w = 0.050 * safezoneW;
				h = 0.020 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.6};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FFFFFF";
						align = "CENTER";
						valign = "TOP";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
		};
	};
	
class ATLVALUE
    {
        idd = 10000101;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "ATLVALUE";
		onLoad = "with uiNameSpace do { ATLVALUE = _this select 0 }";
	class controls 
        {
		    class structuredText
            {
                access = 0;
                type = 13;
                idc = 999130;
                style = 0x00;
                lineSpacing = 1;
				x = 0.475 * safezoneW + safezoneX;
				y = 0.790 * safezoneH + safezoneY;
				w = 0.050 * safezoneW;
				h = 0.050 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.6};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FFFFFF";
						align = "CENTER";
						valign = "TOP";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "5";
								}; 
            };
		};
	};

class ASLVALUE
    {
        idd = 10000101;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "ASLVALUE";
		onLoad = "with uiNameSpace do { ASLVALUE = _this select 0 }";
	class controls 
        {
		    class structuredText
            {
                access = 0;
                type = 13;
                idc = 999140;
                style = 0x00;
                lineSpacing = 1;
				x = 0.475 * safezoneW + safezoneX;
				y = 0.840 * safezoneH + safezoneY;
				w = 0.050 * safezoneW;
				h = 0.020 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.6};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
					class Attributes{
						font = "PuristaSemiBold";
						color = "#FFFFFF";
						align = "CENTER";
						valign = "TOP";
						shadow = false;
						shadowColor = "#000000";
						underline = false;
						size = "2";
								}; 
            };
		};
	};

// ----- END OF ALT

// ----- HEADING 

class AZIMUTH
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 1.5;
    fadeout                     = 2;
    name                        = "AZIMUTH";
    onLoad                      = "with uiNameSpace do { AZIMUTH = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999150;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.475 * safezoneW + safezoneX;
            y                   = 0.090 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]   = {1,1,1,0.6};
            colorText[]         = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2";
            }; 
        };
    };
};

class AZIMUTHVALUE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duration                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "AZIMUTHVALUE";
    onLoad                      = "with uiNameSpace do { AZIMUTHVALUE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999160;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.475 * safezoneW + safezoneX;
            y                   = 0.110 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.050 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "5.5";
            }; 
        };
    };
};
// ----- END OF HEADING

// ----- REVERSE HEADING 


class REVERSEAZIMUTHVALUE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duration                    = 99999;
    fadein                      = 3.5;
    fadeout                     = 2;
    name                        = "REVERSEAZIMUTHVALUE";
    onLoad                      = "with uiNameSpace do { REVERSEAZIMUTHVALUE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999170;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.475 * safezoneW + safezoneX;
            y                   = 0.160 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2";
            }; 
        };
    };
};
// ---- END OF REVERSE HEADING

// -------------------------------------------------------------------------------- END OF AVIONICS




// -------------------------------------------------------------------------------- WAYFINDER

// ----- PZ HEADING 

class PZAZIMUTH
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duration                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "PZAZIMUTH";
    onLoad                      = "with uiNameSpace do { PZAZIMUTH = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999300;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.524 * safezoneW + safezoneX;
            y                   = 0.090 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "RIGHT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2";
            }; 
        };
    };
};

class PZAZIMUTHVALUE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "PZAZIMUTHVALUE";
    onLoad                      = "with uiNameSpace do { PZAZIMUTHVALUE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999310;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.524 * safezoneW + safezoneX;
            y                   = 0.110 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.040 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "RIGHT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "4.5";
            }; 
        };
    };
};

// ----- END OF PZ HEADING 


// ----- LZ HEADING 

class LZAZIMUTH
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duration                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "LZAZIMUTH";
    onLoad                      = "with uiNameSpace do { LZAZIMUTH = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999320;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.4255 * safezoneW + safezoneX;
            y                   = 0.090 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "LEFT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2";
            }; 
        };
    };
};

class LZAZIMUTHVALUE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "LZAZIMUTHVALUE";
    onLoad                      = "with uiNameSpace do { LZAZIMUTHVALUE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999330;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.4255 * safezoneW + safezoneX;
            y                   = 0.110 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.040 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "LEFT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "4";
            }; 
        };
    };
};

// --- END OF LZ HEADING 


// ----- PZ DISTANCE 

class PZDISTANCEVALUE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "PZDISTANCEVALUE";
    onLoad                      = "with uiNameSpace do { PZDISTANCEVALUE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999340;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.524 * safezoneW + safezoneX;
            y                   = 0.150 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "RIGHT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.7";
            }; 
        };
    };
};

// ----- END OF PZ DISTANCE 


// ----- LZ DISTANCE 

class LZDISTANCEVALUE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "LZDISTANCEVALUE";
    onLoad                      = "with uiNameSpace do { LZDISTANCEVALUE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999350;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.4255 * safezoneW + safezoneX;
            y                   = 0.150 * safezoneH + safezoneY;
            w                   = 0.080 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "LEFT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.7";
            }; 
        };
    };
};
// ----- END OF LZ DISTANCE 

// ----- PZ 10 GRID

class PZ10GRID
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "PZ10GRID";
    onLoad                      = "with uiNameSpace do { PZ10GRID = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999370;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.700 * safezoneW + safezoneX;
            y                   = 0.420 * safezoneH + safezoneY;
            w                   = 0.080 * safezoneW;
            h                   = 0.018 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.7";
            }; 
        };
    };
};

// ----- END OF PZ 10 GRID

// ----- LZ 10 GRID


class LZ10GRID
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "LZ10GRID";
    onLoad                      = "with uiNameSpace do { LZ10GRID = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999371;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.700 * safezoneW + safezoneX;
            y                   = 0.437 * safezoneH + safezoneY;
            w                   = 0.080 * safezoneW;
            h                   = 0.016 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.7";
            }; 
        };
    };
};

// ----- END OF LZ 10 GRID

// -------------------------------------------------------------------------------- WAYFINDER END



// -------------------------------------------------------------------------------- INTEL

// ----- SHOW UNIT NUMBERS 

class MISSIONDATA
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "MISSIONDATA";
    onLoad                      = "with uiNameSpace do { MISSIONDATA = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999500;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.900 * safezoneW + safezoneX;
            y                   = 0.200 * safezoneH + safezoneY;
            w                   = 0.100 * safezoneW;
            h                   = 0.200 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0.6};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "RIGHT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2";
            }; 
        };
    };
};
// ----- SHOW UNIT NUMBERS END

// -------------------------------------------------------------------------------- INTEL END



// -------------------------------------------------------------------------------- MESSAGES

// ----- MISSION MESSAGES

class MISSIONMESSAGE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 0.5;
    fadeout                     = 2;
    name                        = "MISSIONMESSAGE";
    onLoad                      = "with uiNameSpace do { MISSIONMESSAGE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999900;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.420 * safezoneW + safezoneX;
            y                   = 0.900 * safezoneH + safezoneY;
            w                   = 0.160 * safezoneW;
            h                   = 0.050 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,1,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#f29730";
                align           = "CENTER";
                valign          = "MIDDLE";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2.5";
            }; 
        };
    };
};

// MISSION MESSAGES END

// ----- LAND MESSAGES

class LANDMESSAGE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 0.5;
    fadeout                     = 2;
    name                        = "LANDMESSAGE";
    onLoad                      = "with uiNameSpace do { LANDMESSAGE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999950;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.420 * safezoneW + safezoneX;
            y                   = 0.740 * safezoneH + safezoneY;
            w                   = 0.160 * safezoneW;
            h                   = 0.031 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,1,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#f29730";
                align           = "CENTER";
                valign          = "MIDDLE";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2.5";
            }; 
        };
    };
};

// LAND MESSAGES END

// -------------------------------------------------------------------------------- MESSAGES END


// -------------------------------------------------------------------------------- MISSION STATES
// NOTE THIS WAS USED FOR DEBUGGING AND MAY BE REMOVED AT SOME POINT, BUT FOR NOW WILL REMAIN
// I can now use this as a HUD element that helps player know what is going on, and is choice of:
// deployment / attack / defend

// ----- MISSION STATES

class MISSIONSTATE
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "MISSIONSTATE";
    onLoad                      = "with uiNameSpace do { MISSIONSTATE = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999910;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.420 * safezoneW + safezoneX;
            y                   = 0.950 * safezoneH + safezoneY;
            w                   = 0.160 * safezoneW;
            h                   = 0.050 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,1,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#f29730";
                align           = "CENTER";
                valign          = "MIDDLE";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.8";
            }; 
        };
    };
};

// ----- MISSION STATES END

// -------------------------------------------------------------------------------- MISSION STATE END

// ----- MISSION SIDE NUMBERS

class BLUDATA
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "BLUDATA";
    onLoad                      = "with uiNameSpace do { BLUDATA = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999510;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.580 * safezoneW + safezoneX;
            y                   = 0.950 * safezoneH + safezoneY;
            w                   = 0.160 * safezoneW;
            h                   = 0.050 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,1,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#f29730";
                align           = "LEFT";
                valign          = "MIDDLE";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.8";
            }; 
        };
    };
};

class OPDATA
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "OPDATA";
    onLoad                      = "with uiNameSpace do { OPDATA = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999520;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.260 * safezoneW + safezoneX;
            y                   = 0.950 * safezoneH + safezoneY;
            w                   = 0.160 * safezoneW;
            h                   = 0.050 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,1,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#f29730";
                align           = "RIGHT";
                valign          = "MIDDLE";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.8";
            }; 
        };
    };
};

// ----- MISSION SIDE NUMBERS END



//20SEPT BOOKMARK

// --------------------------------------------------------- SHOW PZ SLOWDOWN ---------------------


class PZSPEEDWARNING
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "PZSPEEDWARNING";
    onLoad                      = "with uiNameSpace do { PZSPEEDWARNING = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 9991200;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.700 * safezoneW + safezoneX;
            y                   = 0.480 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.8";
            }; 
        };
    };
};


class LZSPEEDWARNING
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "LZSPEEDWARNING";
    onLoad                      = "with uiNameSpace do { LZSPEEDWARNING = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 9991300;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.700 * safezoneW + safezoneX;
            y                   = 0.480 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.8";
            }; 
        };
    };
};





// 20sept on train home 
// i believe i can remove the next block...
/*
class PZ_SLOW
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "PZ_SLOW";
    onLoad                      = "with uiNameSpace do { PZ_SLOW = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 10000;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.450 * safezoneW + safezoneX;
            y                   = 0.600 * safezoneH + safezoneY;
            w                   = 0.100 * safezoneW;
            h                   = 0.050 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "3";
            }; 
        };
    };
};

*/


// --------------------------------------------------------- SHOW UNIDIST ---------------------


class UNIDISTPZ
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "UNIDISTPZ";
    onLoad                      = "with uiNameSpace do { UNIDISTPZ = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999360;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.475 * safezoneW + safezoneX;
            y                   = 0.700 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.040 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#f29730";
                align           = "CENTER";
                valign          = "MIDDLE";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2";
            }; 
        };
    };
};

class UNIDISTLZ
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "UNIDISTLZ";
    onLoad                      = "with uiNameSpace do { UNIDISTLZ = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999361;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.475 * safezoneW + safezoneX;
            y                   = 0.700 * safezoneH + safezoneY;
            w                   = 0.050 * safezoneW;
            h                   = 0.040 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#f29730";
                align           = "CENTER";
                valign          = "MIDDLE";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2";
            }; 
        };
    };
};

// MISSION DATA ---------------------------------------------------------------------------------------------

/*
class MISSIONDATA
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "MISSIONDATA";
    onLoad                      = "with uiNameSpace do { MISSIONDATA = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 21000;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.400 * safezoneW + safezoneX;
            y                   = 0.900 * safezoneH + safezoneY;
            w                   = 0.200 * safezoneW;
            h                   = 0.100 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "CENTER";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "2";
            }; 
        };
    };
};
*/











// ----------------------------------------------------------ALL BACKGROUND TILES GO BELOW HERE -----------	
	
/*
class LABELHUDBACK
{
    idd = 10000;
    movingEnable =  0;
    enableSimulation = 1;
    enableDisplay = 1;
    duration     =  99999;
    fadein       =  2.5;
    fadeout      =  2;
    name = "LABELHUDBACK";
    onLoad = "with uiNameSpace do { LABELHUDBACK = _this select 0 }";

	class controls 
    {
        class structuredText
        {
            access = 0;
            type = 13;
            idc = 900;
            style = 0x00;
            lineSpacing = 1;
            x = 0.2000 * safezoneW + safezoneX;
            y = 0.3400 * safezoneH + safezoneY;
            w = 0.0100 * safezoneW;
            h = 0.4000 * safezoneH;
            size = 0.020;
            colorBackground[] = {0,0,0,0.2};

        };
	};
};	
*/


class RscPicture
{
    access=0;
    type=0;
    idc=-1;
    style=48;
    colorBackground[]={0,0,0,0};
    colorText[]={1,1,1,1};
    font="TahomaB";
    sizeEx=0;
    lineSpacing=0;
    text="";
    shadow = 0;
};

 
/*
class GoALogo
    {
        idd=-1;
        movingEnable=1;
        duration=60;
        fadein=2;
        fadeout=0;
        name="GoA_Logo";
        Controls[]={"Logo"};
        class Logo: RscPicture
        {
            idc = 9999;
            text="images\testhud9.paa";
            style = 0x30 + 0x800;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
            colorBackground[]={1,1,1,1};
            colorText[]={1,1,1,1};
        };
    };
*/

/*
class iFire
{
    idd=-1;
    movingEnable=1;
    duration=600;
    //fadein=4;
    //fadeout=0;
    name="iFire";
    Controls[]={"Logo"};
    class Logo: RscPicture
     {
        idc = 99999;
        // text="images\iTESTFireHud4.paa";
        //text="images\ALPHATEST.paa";
        text="images\TELEM5.paa";
        style = 0x30 + 0x800;
        x = safezoneX;
        y = safezoneY;
        w = safezoneW;
        h = safezoneH;
        //colorBackground[]={1,1,1,1};
        //colorText[]={1,1,1,1};
    };
};

*/

	class WELCOME
    {
        idd = 						1000003;
        movingEnable =  			0;
        enableSimulation = 			1;
        enableDisplay = 			1;
        duration     =  			99999;
        fadein       =  			2.5;
        fadeout      =  			2;
        name = 						"WELCOME";
		onLoad = 					"with uiNameSpace do { WELCOME = _this select 0 }";
	
		class controls 
        {
		    class structuredText
            {
                access = 			0;
                type = 				13;
                idc = 				999999;
                style = 			0x00;
                lineSpacing = 		1;
				x = 				0.100 * safezoneW + safezoneX;
				y = 				0.300 * safezoneH + safezoneY;
				w = 				0.100 * safezoneW;
				h = 				0.100 * safezoneH;
                size = 				0.020;
                colorBackground[] = {1,1,1,0};
                colorText[] = 		{0,0,0,1};
                text = 				"";
                font = 				"PuristaSemiBold";

				class Attributes
				{
					font = 			"PuristaSemiBold";
					color = 		"#FFFFFF";
					align = 		"CENTER";
					valign = 		"TOP";
					shadow = 		false;
					shadowColor = 	"#000000";
					underline = 	false;
					size = 			"2";
				}; 
            };
		};
	};



class MEDEVAC
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "MEDEVAC";
    onLoad                      = "with uiNameSpace do { MEDEVAC = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999911;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.700 * safezoneW + safezoneX;
            y                   = 0.460 * safezoneH + safezoneY;
            w                   = 0.080 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "LEFT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.7";
            }; 
        };
    };
};



class MISSIONTIME
{
    idd                         = 10000200;
    movingEnable                = 0;
    enableSimulation            = 1;
    enableDisplay               = 1;
    duratioN                    = 99999;
    fadein                      = 2.5;
    fadeout                     = 2;
    name                        = "MISSIONTIME";
    onLoad                      = "with uiNameSpace do { MISSIONTIME = _this select 0 }";

    class controls 
    {
        class structuredText
        {
            access              = 0;
            type                = 13;
            idc                 = 999123;
            style               = 0x00;
            lineSpacing         = 1;
            x                   = 0.700 * safezoneW + safezoneX;
            y                   = 0.480 * safezoneH + safezoneY;
            w                   = 0.080 * safezoneW;
            h                   = 0.020 * safezoneH;
            size                = 0.020;
            colorBackground[]  = {1,1,1,0};
            colorText[]        = {0,0,0,1};
            text                = "";
            font                = "PuristaSemiBold";
                
            class Attributes
            {
                font            = "PuristaSemiBold";
                color           = "#FFFFFF";
                align           = "LEFT";
                valign          = "TOP";
                shadow          = false;
                shadowColor     = "#000000";
                underline       = false;
                size            = "1.7";
            }; 
        };
    };
};






/*
            x                   = 0.700 * safezoneW + safezoneX;
            y                   = 0.437 * safezoneH + safezoneY;
            w                   = 0.080 * safezoneW;
            h                   = 0.016 * safezoneH;
*/













	
	
	
};