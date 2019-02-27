local composer = require( "composer" )
local widget = require( "widget" )
 
local scene = composer.newScene()
 
 
-- create()
function scene:create( event )
 

local fundal = display.newImage("fundalslot.png")
fundal.x = display.contentCenterX
fundal.y = display.contentCenterY
fundal.yScale=0.4
fundal.xScale=0.4

local sceneGroup = self.view

--------------------------------------------------FUNCTIE SCHIMBA SCENA
local function schimbaScenaSkip()
    composer.gotoScene("scenaLogin",{effect="slideLeft",time=100})
end

local function schimbaScenaSetup()
    composer.gotoScene("scenaParola",{effect="slideLeft",time=100})
end

local function schimbaScenaBauturi()
    composer.gotoScene("scenaBauturi",{effect="slideLeft",time=100})
end

local function schimbaScenaReguli()
    composer.gotoScene("scenaReguli",{effect="slideLeft",time=100})
end

--------------------------------------------------HEADER
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


--------------------------------------------------BUTON SETUP

local function apasaSetup( event )
 
    if ( "ended" == event.phase ) then
    schimbaScenaSetup();
        
    end
end

local butonSetup=widget.newButton
{
    left=150,
    top=100,
    width=70,
    height=50,
    defaultFile="rotitasetup.png",
    --overFile="play.png",
    onEvent=apasaSetup,
}
butonSetup.x=466.5;
butonSetup.y=282;
butonSetup.yScale=0.8;
butonSetup.xScale=0.5


--------------------------------------------------BUTON SKIP

local function apasaSkip( event )

if ("began"==event.phase) then
 if ipadPremii ==nil or tonumber(ipadPremii)<=0 then 
    ipadPremii=0
 end  

 if iphonePremii ==nil or tonumber(iphonePremii)<=0 then 
    iphonePremii=0
 end

 if watchPremii ==nil or tonumber(watchPremii)<=0 then 
    watchPremii=0
 end

 if airpodsPremii ==nil or tonumber(airpodsPremii)<=0 then 
    airpodsPremii=0
 end

 if tshirtPremii ==nil or tonumber(tshirtPremii)<=0 then 
    tshirtPremii=0
 end

 if walletsPremii ==nil or tonumber(walletsPremii)<=0 then 
    walletsPremii=0
 end

 if freedrinksPremii ==nil or tonumber(freedrinksPremii)<=0 then 
    freedrinksPremii=0
 end
 
 if pinsPremii ==nil or tonumber(pinsPremii)<=0 then 
    pinsPremii=0
 end

 if chancePremii ==nil or tonumber(chancePremii)<=0 then 
    chancePremii=0
 end
end



if("ended"==event.phase) then
 if  ipadPremii ==0 and iphonePremii ==0 and watchPremii ==0 and airpodsPremii ==0 and tshirtPremii ==0 and walletsPremii ==0 and 
   freedrinksPremii ==0 and pinsPremii ==0 and chancePremii ==0 then 
   print ("Valori de 0");
else
    if ( "ended" == event.phase ) then
    for i = #c,1,-1 do
    table.remove(c,i)
    end

    schimbaScenaSkip();
        print(ipadPremii);
        print(iphonePremii)
        print(watchPremii)
        print(airpodsPremii)
        print(tshirtPremii)
        print(walletsPremii)
        print(freedrinksPremii)
        print(pinsPremii)
        print(chancePremii)

        if tonumber(ipadPremii)>0 then
            table.insert( c, 0)
        end
        if tonumber(iphonePremii)>0 then
            table.insert(c,1)
        end
        if tonumber(watchPremii)>0 then
            table.insert(c,2)
        end
        if tonumber(airpodsPremii)>0 then
            table.insert(c,3)
        end
        if tonumber(tshirtPremii)>0 then
            table.insert(c,4)
        end
        if tonumber(walletsPremii)>0 then
            table.insert(c,5)
        end
        if tonumber(freedrinksPremii)>0 then
            table.insert(c,6)
        end
        if tonumber(pinsPremii)>0 then
            table.insert(c,7)
        end
        if tonumber(chancePremii)>0 then
            table.insert(c,8)
        end

   end
 end
end

end

local butonSkip=widget.newButton
{
    left=50,
    top=-10,
    width=90,
    height=100,
    defaultFile="spinit.png",
    --overFile="play.png",
    onEvent=apasaSkip,
}
butonSkip.x=240.5;
butonSkip.y=215;
butonSkip.yScale=1.48;
butonSkip.xScale=1.57


local off = display.newImage("off.png")
off.x = 468
off.y = 255
off.yScale=0.04
off.xScale=0.04
off.isVisible=false;


--------------------------------------------------BUTON MUTE
local aresunet=true;
local function apasaMute( event )
 
    if ( "ended" == event.phase ) then        
        if aresunet==true then
        print("mute");
        audio.setVolume( 0, { channel=0 } );
        aresunet=false;
        off.isVisible=true;
        else
        audio.setVolume(1,{channel=0})
        print("unmute")
        aresunet=true;
        off.isVisible=false;
        end
    end
end

local butonMute=widget.newButton
{
    left=50,
    top=-10,
    width=90,
    height=100,
    defaultFile="unmute.png",
    --overFile="mute.png",
    onEvent=apasaMute,
}
butonMute.x=468;
butonMute.y=255
butonMute.yScale=0.3;
butonMute.xScale=0.4



--------------------------------------------------BUTON MADEBYCHIVAS

local function apasaMade( event )
 
    if ( "ended" == event.phase ) then
    schimbaScenaBauturi();
        
    end
end

local butonMade=widget.newButton
{
    left=50,
    top=-10,
    width=90,
    height=100,
    defaultFile="madebychivas.png",
    --overFile="play.png",
    onEvent=apasaMade,
}
butonMade.x=96;
butonMade.y=215;
butonMade.yScale=1.48;
butonMade.xScale=1.57

--------------------------------------------------BUTON MADEBYCHIVAS

local function apasaHowtoplay( event )
 
    if ( "ended" == event.phase ) then
    schimbaScenaReguli();
    end
end

local butonHow=widget.newButton
{
    left=50,
    top=-10,
    width=90,
    height=100,
    defaultFile="howtoplay.png",
    --overFile="play.png",
    onEvent=apasaHowtoplay,
}
butonHow.x=385;
butonHow.y=215;
butonHow.yScale=1.48;
butonHow.xScale=1.57


--------------------------------------------------ADAUGARE ELEMENTE IN SCENA
sceneGroup:insert(fundal)
sceneGroup:insert(jackp)
sceneGroup:insert(butonSetup)
sceneGroup:insert(butonSkip)

sceneGroup:insert(butonMute)
sceneGroup:insert(butonMade)
sceneGroup:insert(off)
sceneGroup:insert(butonHow)

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
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
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
--------------------------------------------------------------------------------------
 
return scene