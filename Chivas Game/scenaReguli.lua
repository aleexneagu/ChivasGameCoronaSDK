local composer = require( "composer" )
local widget = require( "widget" )
 
local scene = composer.newScene()
 local function schimbaScenaSetup()
    composer.gotoScene("scenaSetup",{effect="slideLeft",time=100})
end
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

--local function schimbaScenaPremii()
  --  composer.gotoScene("scenaPremii",{effect="slideLeft",time=100})
--end


local fundal = display.newImage("fundalslot.png")
fundal.x = display.contentCenterX
fundal.y = display.contentCenterY
fundal.yScale=0.4
fundal.xScale=0.4

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

local function apasaOk( event )
 
    if ( "ended" == event.phase ) then
    schimbaScenaSetup();
        print( "a" )
    end
end

 local butonOk=widget.newButton
{
    left=150,
    top=-10,
    width=90,
    height=100,
    defaultFile="howtoplayscris.png",
}
butonOk.x=240;
butonOk.y=215;
butonOk.yScale=1.48;
butonOk.xScale=4.79



local butonBack=widget.newButton
{
    left=150,
    top=-10,
    width=90,
    height=100,
    defaultFile="sagetica.png",
    --overFile="play.png",
    onEvent=apasaOk,
}
butonBack.x=20;
butonBack.y=306;
butonBack.yScale=0.3;
butonBack.xScale=0.4

sceneGroup:insert(fundal)
sceneGroup:insert(butonOk)
sceneGroup:insert(butonBack)
sceneGroup:insert(jackp)


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