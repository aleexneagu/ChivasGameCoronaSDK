local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()

local function schimbaScenaSetup()
    composer.gotoScene("scenaSetup",{effect="slideLeft",time=100})
end

w=display.viewableContentWidth
h=display.viewableContentHeight
local background=display.newRect(-10000000,-10000000,w,h)
background:setFillColor(0,0,0);

local function gotoGame()
    composer.gotoScene( "scenaJoc" )
    composer.removeScene("scenaPremii");
end

local function apasaOk( event ) 
    if ( "ended" == event.phase ) then
    native.setKeyboardFocus( nil );
    schimbaScenaSetup();
    composer.removeScene("scenaLogin");
        print( "a" )
    end
end

--fundal
local fundal = display.newImage("fundalslot.png")
fundal.x = display.contentCenterX
fundal.y = display.contentCenterY
fundal.yScale=0.4
fundal.xScale=0.4

--linii fire


local lf = display.newImage("firelogin.png")
lf.x = 252
lf.y = 162
lf.yScale=0.42
lf.xScale=0.45


--slotmachine
local sheetData15=
{ 
    width=1024,
    height=1024,
    numFrames=2,
    sheetContentWidth=2048,
    sheetContentHeight=1024
}

local sequenceData15=
{
        {
            name="normalRun",
            frames={1,2},
            time=1000,
            loopCount=0
        }
}

local jp=graphics.newImageSheet("jackpot.png",sheetData15);
local jackp= display.newSprite(jp,sequenceData15);

jackp.x=240;
jackp.y=63;
jackp.xScale=0.49;
jackp.yScale=0.48;
jackp:play();

local butonBack=widget.newButton
{
    left=150,
    top=-10,
    width=90,
    height=100,
    defaultFile="sagetica.png",
    onEvent=apasaOk,
}
butonBack.x=23;
butonBack.y=306;
butonBack.yScale=0.3;
butonBack.xScale=0.4

--texte albe

local numealb= display.newImage("name.png")
numealb.y=165
numealb.x=106.2
numealb.xScale=0.4
numealb.yScale=0.4

local prenumealb= display.newImage("prenume.png")
prenumealb.y=165
prenumealb.x=228
prenumealb.xScale=0.4
prenumealb.yScale=0.4

local locatiealb= display.newImage("location.png")
locatiealb.y=184
locatiealb.x=104.5
locatiealb.xScale=0.4
locatiealb.yScale=0.4

local emailalb= display.newImage("email.png")
emailalb.y=202
emailalb.x=105.5
emailalb.xScale=0.4
emailalb.yScale=0.4

local telefonalb= display.newImage("phone.png")
telefonalb.y=222
telefonalb.x=106
telefonalb.xScale=0.4
telefonalb.yScale=0.4

local dataalba= display.newImage("dateofbirth.png")
dataalba.y=255
dataalba.x=118
dataalba.xScale=0.4
dataalba.yScale=0.4

local nationalitatealba= display.newImage("nationality.png")
nationalitatealba.y=240
nationalitatealba.x=115.8
nationalitatealba.xScale=0.4
nationalitatealba.yScale=0.4

-- create()
function scene:create( event )

local sceneGroup = self.view

local function tsus( event )
    if ( "began" == event.phase ) then
        --textParola.hasBackground=true;
        transition.to( sceneGroup, { time=10,x=0, y=-140} )       
 
    elseif ( "submitted" == event.phase ) then
       native.setKeyboardFocus(nil);
       transition.to( sceneGroup, { time=0,x=0, y=0} );
       --textParola.hasBackground=false;
    end
end



--nume
textNume=native.newTextField(160,100,70,12)
textNume.size=7;
textNume.font=native.newFont(native.systemFontBold,8);
textNume.y=164;
textNume.x=159;
textNume.hasBackground=false;
textNume:addEventListener("userInput",tsus)


--prenume
textPrenume=native.newTextField(160,100,70,12)
textPrenume.size=7;
textPrenume.font=native.newFont(native.systemFontBold,8);
textPrenume.y=164;
textPrenume.x=289;
textPrenume.hasBackground=false;
textPrenume:addEventListener("userInput",tsus)


--locatie
textLocatie=native.newTextField(160,100,200,12)
textLocatie.size=7;
textLocatie.font=native.newFont(native.systemFontBold,8);
textLocatie.text=locatiePremii
textLocatie.y=184;
textLocatie.x=224;
textLocatie.hasBackground=false;
textLocatie:addEventListener("userInput",tsus)


local widget = require( "widget" )
 
local coloane = 
{ 
    { 
        align = "center",
        width = 250,
        labelPadding = 10,
        startIndex = 2,
        labels = { "Hoodie", "Short Sleeve", "Long Sleeve", "Sweatshirt" }
    },
   
}
 
local roatatara = widget.newPickerWheel(
{
    x=245,
    y=100,
    columns = coloane,
    style = "resizable",
    width = 250,
    rowHeight = 12,
    fontSize = 11,
    onValueSelected = pickerSelectionListener;
})
roatatara.isVisible=false;



local function textNationalitate2(event)

    native.setKeyboardFocus( nil );
    if (event.phase =="began") then
        --roatatara.isVisible=true;
        composer.gotoScene("scenaRoata",{effect="slideLeft",time=100});
        native.setKeyboardFocus( nil );

    end
    if (event.phase =="ended") then 
        --valori = roatatara:getValues()
        --roatatara.isVisible=false;
        textNationalitate.text=valoriselectate;
        native.setKeyboardFocus( nil )
        
    end
end

--
--telefon
textTelefon=native.newTextField(160,180,200,12)
textTelefon.size=7;
textTelefon.font=native.newFont(native.systemFontBold,8);
textTelefon.y=220;
textTelefon.x=224;
textTelefon.hasBackground=false;
textTelefon.inputType="number"
textTelefon:addEventListener("userInput",tsus)


--nationalitate
textNationalitate=native.newTextField(160,180,150,12)
textNationalitate.size=7;
textNationalitate.font=native.newFont(native.systemFontBold,8);
textNationalitate.y=237;
textNationalitate.x=249;
textNationalitate.hasBackground=false;
textNationalitate:addEventListener("userInput",textNationalitate2)



local function textdat(event)

    native.setKeyboardFocus( nil );
    if (event.phase =="began") then
        composer.gotoScene("scenaRoataData",{effect="slideLeft",time=100});
        native.setKeyboardFocus( nil );

    end
    if (event.phase =="ended") then 
        textDt.text=valoriselectatedata;
        native.setKeyboardFocus( nil )
        
    end
end

--textdata
textDt=native.newTextField(160,180,150,12)
textDt.size=7;
textDt.font=native.newFont(native.systemFontBold,8);
textDt.y=255;
textDt.x=249;
textDt.hasBackground=false;
textDt:addEventListener("userInput",textdat)


--email
textEmail=native.newTextField(160,260,200,12)
textEmail.size=7;
textEmail.font=native.newFont(native.systemFontBold,8);
textEmail.y=201;
textEmail.x=224;
textEmail.hasBackground=false;
textEmail:addEventListener("userInput",tsus)

--campuri
--baramail
local bara1= display.newImage("bara.png")
bara1.y=203;
bara1.x=225;
bara1.yScale=0.4
bara1.xScale=0.4

--baranume
local bara2= display.newImage("baramicuta.png")
bara2.y=165;
bara2.x=160;
bara2.yScale=0.45
bara2.xScale=0.35

--baratelefon
local bara3= display.newImage("bara.png")
bara3.y=222;
bara3.x=225
bara3.yScale=0.4
bara3.xScale=0.4

--baralocatie
local bara4= display.newImage("bara.png")
bara4.y=185;
bara4.x=225
bara4.yScale=0.4
bara4.xScale=0.4

--baranationalitate 
local bara5= display.newImage("bara2.png")
bara5.y=237;
bara5.x=250
bara5.yScale=0.4
bara5.xScale=0.4

--baraprenume
local bara6= display.newImage("baramicuta.png")
bara6.y=165;
bara6.x=290
bara6.yScale=0.45
bara6.xScale=0.35

local bara7= display.newImage("bara2.png")
bara7.y=255;
bara7.x=250
bara7.yScale=0.4
bara7.xScale=0.4

local widget=require("widget")
--[[
local zile={}
local ani={}

for z=1,31 do
    zile[z]=z;
end

for a=1,51 do
    ani[a]=1949+a
end

local coloaneData = 
    {
        --luni
        {
        align="center",
        width=70, 
        startIndex=5,
        labels={
                "January", "February", "March", "April", "May", "June", "July", 
                "August", "September", "October", "November", "December"
               }
        },

        --zile
        {
            align="right",
            width=22,
            startIndex=18,
            labelPadding = 10,
            labels=zile
        },

        --ani
        {
            align="center",
            width=40,
            startIndex=10,
            labels=ani,
        }   
    }

local roata=widget.newPickerWheel
    {
        top=display.contentHeight-100,
        columns=coloaneData,
        fontSize=8,
        style="resizable",
        rowHeight=8;
        width=150;
        onValueSelected = pickerSelectionListener;
    }
roata.y=267;
roata.x=248;


local overlay2= display.newImage("overlay150.png")
overlay2.x=248.15
overlay2.y=266.9
overlay2.yScale=1.35
overlay2.xScale=1
]]--

local sticla=display.newImage("sticla.png")
sticla.xScale=0.55;
sticla.yScale=0.55
sticla.x=50
sticla.y=220

--adaugare in grup
sceneGroup:insert(fundal)
sceneGroup:insert(lf)
sceneGroup:insert(jackp)
sceneGroup:insert(bara1)
sceneGroup:insert(bara2)
sceneGroup:insert(bara3)
sceneGroup:insert(bara4)
sceneGroup:insert(bara5)
sceneGroup:insert(bara6)
sceneGroup:insert(bara7)
sceneGroup:insert(textNume)
sceneGroup:insert(textEmail)
sceneGroup:insert(textTelefon)
sceneGroup:insert(numealb)
sceneGroup:insert(emailalb)
sceneGroup:insert(telefonalb)
sceneGroup:insert(dataalba)
sceneGroup:insert(prenumealb)
sceneGroup:insert(locatiealb)
sceneGroup:insert(nationalitatealba)
sceneGroup:insert(dataalba)
sceneGroup:insert(textTelefon)
sceneGroup:insert(textEmail)
sceneGroup:insert(textNume)
sceneGroup:insert(textDt)
sceneGroup:insert(textNationalitate)
sceneGroup:insert(textLocatie)
sceneGroup:insert(textPrenume)
sceneGroup:insert(butonBack)

--sceneGroup:insert(roata)
sceneGroup:insert(sticla)
--sceneGroup:insert(overlay2)
sceneGroup:insert(roatatara)


local function schimbaScena()
	composer.gotoScene("joc",{effect="slideLeft",time=100})
end

local playsound = audio.loadStream("play.wav")
local url = 'http://dev.storagecontrol.ro/winners.php'
local function networkListener(query)
        if ( query.isError ) then
            print( "Network error!", query.response )
        else
            print ( "RESPONSE: " .. query.response )
        end
end


azi=os.date( "*t" );

local function handleButtonEvent(event)
    local phase=event.phase
    if "began" == phase then
    	 
		 telef=textTelefon.text
		 textn=textNume.text
		 em=textEmail.text
         pre=textPrenume.text
         loc=textLocatie.text
         nat=textNationalitate.text
    end
        
    if "ended" == phase then
    native.setKeyboardFocus( nil )
    if  string.len(textNume.text)<1 or string.len(textPrenume.text)<1 or string.len(textPrenume.text)<1 or string.len(textNationalitate.text)<1 or string.len(textEmail.text)<1 or string.len(textLocatie.text)<1 then
        local alert=native.showAlert("Chivas Game","All fields are mandatory.",{"OK"},handleButtonEvent);
    else
    sunetplay = audio.play( playsound, {  loops=0, fadein=0} )
 	schimbaScena();
    composer.removeScene("scenaLogin");
    end
	end
end
    
function query()
    
        
        if aaaaa==1 then
            premiu="ipad"
        end
        if aaaaa==2 then
            premiu="iphone"
        end
        if aaaaa==3 then
            premiu="ceas"
        end
        if aaaaa==4 then
            premiu="airpods"
        end
        if aaaaa==5 then
            premiu="tricouri"
        end
        if aaaaa==6 then
            premiu="portofele"
        end
        if aaaaa==7 then
            premiu="freedrinks"
        end
        if aaaaa==8 then
            premiu="pins"
        end
        if aaaaa==9 then
            premiu="chance"
        end

        local params = 
        {
            body = "name="..textn.."&surname="..pre.."&email="..em.."&phone="..telef.."&nationality="..nat.."&dateofbirth="..valoriselectatedata..
            "&date="..dataPremii.."&city="..orasPremii.."&venue="..loc.."&operator="..operatorPremii.."&prize="..premiu,
        };
        network.request(url,"POST",networkListener, params)
end
    
local buton=widget.newButton
{
    left=150,
    top=-10,
    width=90,
    height=100,
    defaultFile="playd.png",
    overFile="play.png",
    onEvent=handleButtonEvent,
}
buton.x=425;
buton.y=241.6;
buton.yScale=0.38;
buton.xScale=1.18
sceneGroup:insert(buton)
 
function background:tap(event)
    native.setKeyboardFocus( nil )
end

background:addEventListener("tap",background)
end

-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end

-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
	
	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end

-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
return scene
