local composer = require( "composer" )
local widget = require( "widget" )
 
local scene = composer.newScene()
 
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

local fundal = display.newImage("fundalslot.png")
fundal.x = display.contentCenterX
fundal.y = display.contentCenterY
fundal.yScale=0.4
fundal.xScale=0.4
sceneGroup:insert(fundal)

local lf=display.newImage("fireparola.png");

lf.xScale=0.40;
lf.yScale=0.40
lf.x=265;
lf.y=106;

sceneGroup:insert(lf)

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
sceneGroup:insert(jackp)
--textparola
local parolaalba= display.newImage("password.png")
parolaalba.y=193
parolaalba.x=120
parolaalba.xScale=0.4
parolaalba.yScale=0.4

sceneGroup:insert(parolaalba)


local function tparola( event )
    if ( "began" == event.phase ) then
        --textParola.hasBackground=true;
        transition.to( sceneGroup, { time=10,x=0, y=-140} )       
 
    elseif ( "submitted" == event.phase ) then
        native.setKeyboardFocus(nil);
       transition.to( sceneGroup, { time=0,x=0, y=0} ); 
       --textParola.hasBackground=false;  
    end
end

--camp parola
textParola=native.newTextField(160,100,200,12)
--textParola.size=16;
textParola.font=native.newFont(native.systemFontBold,8);
textParola.y=191;
textParola.x=248
textParola.hasBackground=false;
textParola.isSecure = true;
textParola:addEventListener("userInput",tparola)
sceneGroup:insert(textParola)

--bara parola
local bara= display.newImage("bara.png")
bara.y=193;
bara.x=250
bara.yScale=0.4
bara.xScale=0.4
sceneGroup:insert(bara)


local function schimbaScenaPremii()
    composer.gotoScene("scenaPremii",{effect="slideLeft",time=100})
end

local function schimbaScenaSetup()
    composer.gotoScene("scenaSetup",{effect="slideLeft",time=100})
end

local function apasaOk( event )
 
    if ( "ended" == event.phase ) then
      if  string.len(textParola.text)<1 then
        local alert=native.showAlert("Chivas Game","Password required.",{"OK"});
    else
    schimbaScenaPremii();
    native.setKeyboardFocus(nil);
    composer.removeScene("scenaParola");
    
        
    end
end
end


local function apasaSagetica( event )
 
    if ( "ended" == event.phase ) then
    schimbaScenaSetup();
    native.setKeyboardFocus(nil);
    composer.removeScene("scenaParola");
        
    end
end

 local butonOk=widget.newButton
{
    left=150,
    top=-10,
    width=90,
    height=100,
    defaultFile="okparola.png",
    --overFile="play.png",
    onEvent=apasaOk,
}
butonOk.x=245;
butonOk.y=234;
butonOk.yScale=0.3;
butonOk.xScale=0.55

sceneGroup:insert(butonOk)


local butonBack=widget.newButton
{
    left=150,
    top=-10,
    width=90,
    height=100,
    defaultFile="sagetica.png",
    --overFile="play.png",
    onEvent=apasaSagetica,
}
butonBack.x=20;
butonBack.y=306;
butonBack.yScale=0.3;
butonBack.xScale=0.4

sceneGroup:insert(butonBack)


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
-- -----------------------------------------------------------------------------------
 
return scene