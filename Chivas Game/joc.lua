
local composer = require( "composer" )
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoGame()
    composer.gotoScene( "main" )
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

local sceneGroup2 = self.view
local phase = event.phase

local widget=require("widget")

local function schimba()
    composer.gotoScene("scenaSetup",{effect="slideLeft",time=100})
end


local function networkListenerLoginRefresh( event )
    if ( event.isError ) then 
        print( "Network error!")
    else 
        print ( "RESPONSE" )
        estatus = event.status
        online  = true    
        if estatus == 200  then
             	k = json.decode( event.response )
              for key in pairs(k) do    
                print (key,k[key])

                if key=="ipad" then
                    ipadPremii=k[key]
                end
                if key=="iphone" then
                    iphonePremii=k[key]
                end
                if key=="ceas" then
                    watchPremii=k[key]
                end
                if key=="airpods" then
            		airpodsPremii=k[key]
                end
                if key=="tricouri" then
					tshirtPremii=k[key]
                end
                if key=="portofele" then
                    walletsPremii=k[key]
                end
                if key=="freedrinks" then
                    freedrinksPremii=k[key]
                end
                if key=="pins" then
                    pinsPremii=k[key]
                end
                if key=="chance" then
                  chancePremii=k[key]
                end
              end
        end
    end
end
 astazi=os.date( "*t" );
local function getLoginRefresh()
        dataPremii=tostring(astazi.year.."/"..astazi.month.."/"..astazi.day);        
    local paramsr = 
        {
            body = "&date="..dataPremii.."&city="..orasPremii.."&location="..locatiePremii.."&operator"..operatorPremii,
        };    
    network.request( "http://dev.storagecontrol.ro/luckydrinksprizes.php", "POST", networkListenerLoginRefresh,paramsr )
end

local function apasa( event )
	
    if ( "ended" == event.phase ) then
       schimba();
       getLoginRefresh();
       composer.removeScene("joc");
        print( ipadPremii);
        print(iphonePremii)
        print(watchPremii)
        print(airpodsPremii)
        print(tshirtPremii)
        print(walletsPremii)
        print(freedrinksPremii)
        print(pinsPremii)
        print(chancePremii)
        print("**************")
    end
end

local fundal = display.newImage("fundalslotliniescurta.png")
fundal.x = display.contentCenterX
fundal.y = display.contentCenterY
fundal.yScale=0.4
fundal.xScale=0.4

sceneGroup2:insert(fundal)

local frame=display.newImageRect("frame.png",1280,800);
frame.x=240
frame.y=160
frame.xScale=0.4
frame.yScale=0.4

sceneGroup2:insert(frame)

local joc = display.newImage("joc.png")
joc.x = display.contentCenterX
joc.y = display.contentCenterY
joc.yScale=0.4
joc.xScale=0.4

sceneGroup2:insert(joc)

 local butonOkk=widget.newButton
{
    left=300,
    top=-10,
    width=90,
    height=100,
    defaultFile="sagetica.png",
    onEvent=apasa;
}
sceneGroup2:insert(butonOkk)

butonOkk.x=20;
butonOkk.y=300;
butonOkk.yScale=0.3;
butonOkk.xScale=0.4


local sheetData11=
{ 
	width=1024,
	height=1024,
	numFrames=2,
	sheetContentWidth=2048,
	sheetContentHeight=1024
}


local sequenceData11=
{
		{
			name="normalRun",
			frames={1,2},
			time=1000,
			loopCount=100
		}
}

local beculete=graphics.newImageSheet("beculete.png",sheetData11);
local beculeteanimate= display.newSprite(beculete,sequenceData11);

beculeteanimate.x=33;
beculeteanimate.y=75;
beculeteanimate.xScale=0.04;
beculeteanimate.yScale=0.04;

beculeteanimate:play();

sceneGroup2:insert(beculeteanimate)


local sheetData12=
{ 
	width=1024,
	height=1024,
	numFrames=2,
	sheetContentWidth=2048,
	sheetContentHeight=1024
}


local sequenceData12=
{
		{
			name="normalRun",
			frames={1,2},
			time=1000,
			loopCount=100
		}
}

local beculete2=graphics.newImageSheet("beculete.png",sheetData12);
local beculeteanimate2= display.newSprite(beculete2,sequenceData12);

beculeteanimate2.x=33;
beculeteanimate2.y=248;
beculeteanimate2.xScale=0.04;
beculeteanimate2.yScale=0.04;

beculeteanimate2:play();

sceneGroup2:insert(beculeteanimate2)


local sheetData13=
{ 
	width=1024,
	height=1024,
	numFrames=2,
	sheetContentWidth=2048,
	sheetContentHeight=1024
}


local sequenceData13=
{
		{
			name="normalRun",
			frames={1,2},
			time=1000,
			loopCount=100
		}
}

local beculete3=graphics.newImageSheet("beculete.png",sheetData13);
local beculeteanimate3= display.newSprite(beculete3,sequenceData13);

beculeteanimate3.x=447;
beculeteanimate3.y=248;
beculeteanimate3.xScale=0.04;
beculeteanimate3.yScale=0.04;

beculeteanimate3:play();
sceneGroup2:insert(beculeteanimate3)

local sheetData14=
{ 
	width=1024,
	height=1024,
	numFrames=2,
	sheetContentWidth=2048,
	sheetContentHeight=1024
}


local sequenceData14=
{
		{
			name="normalRun",
			frames={1,2},
			time=1000,
			loopCount=100
		}
}

local beculete4=graphics.newImageSheet("beculete.png",sheetData14);
local beculeteanimate4= display.newSprite(beculete4,sequenceData14);

beculeteanimate4.x=447;
beculeteanimate4.y=75;
beculeteanimate4.xScale=0.04;
beculeteanimate4.yScale=0.04;

beculeteanimate4:play();
sceneGroup2:insert(beculeteanimate4)

i=1;
j=1;

tricouri=0;
portofele=0;
boxe=0;
casti=0;

aaaaa=c[math.random(#c)]+1;

local function  handleButtonEvent(event)

local spinsound = audio.loadSound("play.wav")
sunetspin = audio.play( spinsound, {  loops=0, fadein=100} )

audio.setVolume(1)
local ruleta = audio.loadStream("spin2.wav")
	local phase=event.phase
	if "ended" == phase then
		
	    query();
		myButton.isVisible=false;

		ruleta = audio.play( ruleta, {  loops=0, fadein=100} )

		if tricouri%10==0 and tricouri ~=0  then
			boxe=boxe+1;
			j=1;
		else
		if j<3  then
			if j==1 then
				tricouri=tricouri+1;
			end
			 if j==2 then
				portofele=portofele+1;
			 end
			j=j+1;
		else
			j=1;
		end
end

------------------------------------ 1

local sheetData=
{ 
	width=256,
	height=512,
	numFrames=10,
	sheetContentWidth=1280,
	sheetContentHeight=1024
}


local sequenceData=
{
		{
			name="normalRun",
			frames={math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),
			math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),aaaaa},
			
			time=700;
			loopCount=2
			
		}
}

local mySheet=graphics.newImageSheet("premiinoi.png",sheetData);
local animation= display.newSprite(mySheet,sequenceData)
animation.x=110
animation.y=160
animation.xScale=0.4
animation.yScale=0.4
animation:setSequence("normalRun")
animation.timeScale=0.3
sceneGroup2:insert(animation)

------------------------------------ 2
local sheetData2=
{ 
	width=256,
	height=512,
	numFrames=10,
	sheetContentWidth=1280,
	sheetContentHeight=1024
}

local sequenceData2=
{
		{
			name="normalRun",
			frames={math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),
			math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),aaaaa},
			
			time=700;
			loopCount=3;
		}
}

local mySheet2=graphics.newImageSheet("premiinoi.png",sheetData2);
local animation2= display.newSprite(mySheet2,sequenceData2)
animation2.x=374
animation2.y=160
animation2.xScale=0.4
animation2.yScale=0.4
animation2:setSequence("normalRun")
animation2.timeScale=0.3

sceneGroup2:insert(animation2)


------------------------------------ 3

local sheetData3= { 
	width=256,
	height=512,
	numFrames=10,
	sheetContentWidth=1280,
	sheetContentHeight=1024
}

local sequenceData3=
{
		{		
			name="normalRun",
			frames={math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),
			math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),math.random(1, 9),aaaaa},
			
			time=500;
			loopCount=1
		}
}

local mySheet3=graphics.newImageSheet("premiinoi.png",sheetData3);
local animation3= display.newSprite(mySheet3,sequenceData3)
animation3.x=240
animation3.y=160
animation3.xScale=0.4
animation3.yScale=0.4
animation3:setSequence("normalRun")
animation3.timeScale=0.3

sceneGroup2:insert(animation3)

	animation:play()
	animation2:play()
	animation3:play()

local function spriteListener( event )
 
    local thisSprite = event.target  -- "event.target" references the sprite
if ( event.phase == "ended" ) then 
      
       w=display.contentWidth;
	   h=display.contentHeight;

	   local physics=require("physics");
	   physics.start();


local sheetData10=
{ 
	width=1024,
	height=1024,
	numFrames=2,
	sheetContentWidth=2048,
	sheetContentHeight=1024
}


local sequenceData10=
{
		{
			name="normalRun",
			frames={1,2},
			time=1000,
			loopCount=100
		}
}

local youwon=graphics.newImageSheet("a.png",sheetData10);
local youanimat= display.newSprite(youwon,sequenceData10);

youanimat.x=174;
youanimat.xScale=0.25;
youanimat.yScale=0.25;

sceneGroup2:insert(youanimat)

local out = audio.loadSound("out.wav")
sunetout = audio.play( out, {  loops=0, fadein=100} )

youanimat:play();

local tada = audio.loadStream("tada.wav")
tadasunet = audio.play( tada, {  loops=0, fadein=100} )

physics.addBody(youanimat,{density=1,friction=0.6,radius=50});

local floor=display.newRect(0,0,w,0);
floor.x=170;
floor.y=210;


physics.addBody(floor, "static",{friction=0,bounce=0.5});
    end
end
 
animation2:addEventListener( "sprite", spriteListener )


	end
end

----spin

 myButton=widget.newButton
{
	left=190,
	top=135,
	width=100,
	height=50,
	defaultFile="butonspin.png",
	overFile="spinglow.png",
	onEvent=handleButtonEvent
} 
myButton.rotation=0;
myButton.yScale=0.8
myButton.xScale=1.3

sceneGroup2:insert(myButton);
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
