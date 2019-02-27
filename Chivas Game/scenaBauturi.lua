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

c1 = display.newImage("c1.png")
c1.x=231;
c1.y=214.8;
c1.xScale=0.38;
c1.yScale=0.39
c1.isVisible=true;

c2 = display.newImage("c2.png")
c2.x=231;
c2.y=214.8;
c2.xScale=0.38;
c2.yScale=0.39
c2.isVisible=false;

c3 = display.newImage("c3.png")
c3.x=231;
c3.y=214.8;
c3.xScale=0.38;
c3.yScale=0.39
c3.isVisible=false;

c4 = display.newImage("c4.png")
c4.x=231;
c4.y=214.8;
c4.xScale=0.38;
c4.yScale=0.39
c4.isVisible=false;




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
            loopCount = 0
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

local butonBack=widget.newButton
{
    left=150,
    top=-10,
    width=90,
    height=100,
    defaultFile="sagetica.png",
    onEvent=apasaOk,
}
butonBack.x=20;
butonBack.y=306;
butonBack.yScale=0.3;
butonBack.xScale=0.4

--------------------------------------------------Slider

local widget = require( "widget" )
     
-- Slider listener
local function sliderListener( event )

   if event.value<25 then
        c1.isVisible=true;
        c3.isVisible=false;
        c2.isVisible=false;
        c4.isVisible=false;
   		c1.x=231;
		c1.y=214.8;
		c1.xScale=0.38;
		c1.yScale=0.39

   else if event.value>25 and event.value<50 then
   	    c2.isVisible=true;
   	    c1.isVisible=false;
        c3.isVisible=false;
        c4.isVisible=false;
		c2.x=231;
		c2.y=214.8;
		c2.xScale=0.38;
		c2.yScale=0.39
	else if event.value>50 and event.value<75 then
	    c3.isVisible=true;
	    c1.isVisible=false;
        c2.isVisible=false;
        c4.isVisible=false;
		c3.x=231;
		c3.y=214.8;
		c3.xScale=0.38;
		c3.yScale=0.39
   else    
        c1.isVisible=false;
        c2.isVisible=false;
        c3.isVisible=false;
        c4.isVisible=true;
		c4.x=231;
		c4.y=214.8;
		c4.xScale=0.38;
		c4.yScale=0.39
		
      end
	end
  end
end
 
-- Create the widget
local slider = widget.newSlider(
    {
        x = 460,
        y = 220,
        orientation = "vertical",
        height = 130,
        value = 100,  -- Start slider at 10% (optional)
        listener = sliderListener
    }
)


sceneGroup:insert(fundal)
sceneGroup:insert(butonBack)
sceneGroup:insert(jackp)
sceneGroup:insert(slider)
sceneGroup:insert(c3)
sceneGroup:insert(c2)
sceneGroup:insert(c4)
sceneGroup:insert(c1)


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