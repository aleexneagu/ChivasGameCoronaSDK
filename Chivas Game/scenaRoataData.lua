local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    
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

local fundal = display.newImage("fundalslot.png")
fundal.x = display.contentCenterX
fundal.y = display.contentCenterY
fundal.yScale=0.4
fundal.xScale=0.4


local widget=require("widget")
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
        width=170, 
        startIndex=7,
        labels={
                "January", "February", "March", "April", "May", "June", "July", 
                "August", "September", "October", "November", "December"
               }
        },

        --zile
        {
            align="center",
            width=170,
            startIndex=16,
            labelPadding = 10,
            labels=zile
        },

        --ani
        {
            align="center",
            width=170,
            startIndex=40,
            labels=ani,
        }   
    }

local roata3=widget.newPickerWheel
    {
        x=245,
        y=215,
        columns=coloaneData,
        style="resizable",
        rowHeight=28;
        fontSize=24,
        width=510;
        onValueSelected = pickerSelectionListener;
    }

local function apasaOk( event ) 


    if ("began" == event.phase) then
      va = roata3:getValues()
         if va[1].value=="January" then
            m = "01";
         end
         if va[1].value=="February" then
            m = "02";
         end
         if va[1].value=="March" then
            m = "03";
         end
         if va[1].value=="April" then
            m = "04";
         end
         if va[1].value=="May" then
            m = "05";
         end
         if va[1].value=="June" then
            m = "06";
         end
         if va[1].value=="July" then
            m = "07";
         end
         if va[1].value=="August" then
            m = "08";
         end
         if va[1].value=="September" then
            m = "09";
         end
         if va[1].value=="October" then
            m = "10";
         end
         if va[1].value=="November" then
            m = "11";
         end
         if va[1].value=="December" then
            m = "12";
         end
         
         d= va[2].value;
         yr= va[3].value;
         print(m..d..yr)
         valoriselectatedata=tostring(yr.."/"..m.."/"..d);
         print(valoriselectatedata)
         textDt.text=valoriselectatedata;
    end

    if ( "ended" == event.phase ) then
         
        composer.gotoScene("scenaLogin",{effect="slideLeft",time=100})
        composer.removeScene("scenaRoata");
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
butonBack.x=23;
butonBack.y=306;
butonBack.yScale=0.3;
butonBack.xScale=0.4

sceneGroup:insert(fundal);
sceneGroup:insert(roata3)
sceneGroup:insert(jackp)
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
