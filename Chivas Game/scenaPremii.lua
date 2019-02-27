local composer = require( "composer" )
local widget = require( "widget" )
 
local scene = composer.newScene()

 local function schimbaScenaSetup()
    composer.gotoScene("scenaSetup",{effect="slideLeft",time=100})
end
 
 
-- create()
function scene:create( event )


 local sceneGroup = self.view
    
local function schimbaScenaSetup()
    composer.gotoScene("scenaSetup",{effect="slideLeft",time=100})
end

local url = 'http://dev.storagecontrol.ro/luckydrinks.php'
local function networkListener(query)
        if ( query.isError ) then
            print( "Network error!", query.response )
        else
            print ( "RESPONSE: " .. query.response )
        end
end

local widget = require( "widget" )

local columnData = 
{ 
    { 
        align = "center",
        width = 70,
        labelPadding = 10,
        startIndex = 2,
        labels = { "Abu Dhabi", "Dubai", "Bahrein" }
    },
}
 
local options = {
    frames =
    {
        { x=0, y=0, width=20, height=20     },
        { x=20, y=0, width=120, height=20   },
        { x=140, y=0, width=20, height=20   },
        { x=0, y=20, width=20, height=120   },
        { x=140, y=20, width=20, height=120 },
        { x=0, y=140, width=20, height=20   },
        { x=20, y=140, width=120, height=20 },
        { x=140, y=140, width=20, height=20 },
        { x=180, y=0, width=32, height=80   },
        { x=224, y=0, width=32, height=80   },
        { x=276, y=0, width=32, height=20   },
        { x=276, y=60, width=32, height=20  },
        { x=276, y=100, width=12, height=32 }
    },
    sheetContentWidth = 40,
    sheetContentHeight = 20
}
local pickerWheelSheet = graphics.newImageSheet( "fundal",options )
 
local pickerWheel = widget.newPickerWheel(
{
    x = display.contentCenterX,
    top = display.contentHeight - 176,
    columns = columnData,
    style = "resizable",
    width = 70,
    rowHeight =8,
    fontSize = 7,	
    sheet = pickerWheelSheet,
    topLeftFrame = 1,
    topMiddleFrame = 2,
    topRightFrame = 3,
    middleLeftFrame = 4,
    middleRightFrame = 5,
    bottomLeftFrame = 6,
    bottomMiddleFrame = 7,
    bottomRightFrame = 8,
    topFadeFrame = 9,
    bottomFadeFrame = 10,
    middleSpanTopFrame = 11,
    middleSpanBottomFrame = 12,
    separatorFrame = 13,
    middleSpanOffset = 0.3,
    borderPadding = 8
})

pickerWheel.x=250
pickerWheel.y=193


local function apasaOk( event )
    local phase=event.phase
    if string.len(textLocatie.text)>0 and string.len(textDate.text) >0 and string.len(textOperator.text)>0 then
        
    if "began" == phase then
        native.setKeyboardFocus( nil )
        dataPremii=textDate.text;
        local values = pickerWheel:getValues()
        orasPremii=values[1].value;
        locatiePremii=textLocatie.text;
        operatorPremii=textOperator.text;
        ipadPremii=tonumber(textIpad.text);
        iphonePremii=tonumber(textIphone.text);
        watchPremii=tonumber(textWatch.text);
        airpodsPremii=tonumber(textAirpods.text);
        tshirtPremii=tonumber(textTshirt.text);
        walletsPremii=tonumber(textWallet.text);
        freedrinksPremii=tonumber(textFd.text);
        pinsPremii=tonumber(textPins.text);
        chancePremii=tonumber(text2x.text);
       
        query();
    end
    if ( "ended" == event.phase ) then
    schimbaScenaSetup();
    composer.removeScene("scenaPremii");
    end
end
end
json=require("json")

     local loadingText = display.newText("Loading ...", 360, 220, native.systemFont, 15)
           loadingText:setTextColor(255, 255, 255)
           loadingText.isVisible=false;

local function networkListenerLogin( event )
    if ( event.isError ) then 
        print( "Network error!")
    else 
        print ( "RESPONSE" )
        estatus = event.status
        online  = true
             t = json.decode( event.response )
            for key in pairs(t) do    
                print (key,t[key])
                if key=="ipad" then
                    textIpad.text=tostring(t[key])
                end
                if key=="iphone" then
                    textIphone.text=tostring(t[key])
                end
                if key=="ceas" then
                    textWatch.text=tostring(t[key])
                end
                if key=="airpods" then
                    textAirpods.text=tostring(t[key])
                end
                if key=="tricouri" then
                    textTshirt.text=tostring(t[key])
                end
                if key=="portofele" then
                    textWallet.text=tostring(t[key])
                end
                if key=="freedrinks" then
                    textFd.text=tostring(t[key])
                end
                if key=="pins" then
                    textPins.text=tostring(t[key])
                end
                if key=="chance" then
                  text2x.text=tostring(t[key])
                end
            end
             loadingText.isVisible=false;
    end
end
 
local function getLogin()
    loadingText.isVisible=true;
    network.request( "http://dev.storagecontrol.ro/luckydrinksprizes.php", "GET", networkListenerLogin )
end

local loadingText2 = display.newText("Loading ...", 360, 220, native.systemFont, 15)
           loadingText2:setTextColor(255, 255, 255)
           loadingText2.isVisible=false;
           
local function networkListenerLoginRefresh( event )
    
    if ( event.isError ) then 
        print( "Network error!")
    else 
        print ( "RESPONSE" )
        estatus = event.status
        online  = true

        if string.len(textLocatie.text)>0 and string.len(textDate.text)>0 and string.len(textOperator.text)>0 then 
            
             	k = json.decode( event.response )
            for key in pairs(k) do    
                print (key,k[key])

                if key=="ipad" then
                    textIpad.text=tostring(k[key])
                end
                if key=="iphone" then
                    textIphone.text=tostring(k[key])
                end
                if key=="ceas" then
                    textWatch.text=tostring(k[key])
                end
                if key=="airpods" then
                    textAirpods.text=tostring(k[key])
                end
                if key=="tricouri" then
                    textTshirt.text=tostring(k[key])
                end
                if key=="portofele" then
                    textWallet.text=tostring(k[key])
                end
                if key=="freedrinks" then
                    textFd.text=tostring(k[key])
                end
                if key=="pins" then
                    textPins.text=tostring(k[key])
                end
                if key=="chance" then
                  text2x.text=tostring(k[key])
                end 
            end
        end
        loadingText2.isVisible=false;
    end
end
 
local function getLoginRefresh()
        
        if (string.len(textLocatie.text)>0 and string.len(textDate.text)>0 and string.len(textOperator.text)>0) then
        loadingText2.isVisible=true;
        else
        loadingText2.isVisible=false;
        end 
         
        dataPremii=tostring(azi.year.."/"..azi.month.."/"..azi.day);
        local values2 = pickerWheel:getValues()
        orasPremii=values2[1].value;
        locatiePremii=textLocatie.text;
        operatorPremii=textOperator.text;
    local paramsr = 
        {
            body = "&date="..dataPremii.."&city="..orasPremii.."&location="..locatiePremii.."&operator"..operatorPremii,
        };    
    network.request( "http://dev.storagecontrol.ro/luckydrinksprizes.php", "POST", networkListenerLoginRefresh,paramsr )
end

function query()
        local params = 
        {
            body = "&Data="..dataPremii.."&Oras="..orasPremii.."&Locatie="..locatiePremii.."&Operator="..operatorPremii.."&Ipad="..ipadPremii.."&Iphone="
            ..iphonePremii.."&Ceas="..watchPremii.."&Airpods="..airpodsPremii.."&Tricouri="..tshirtPremii.."&Portofele="
            ..walletsPremii.."&FreeDrinks="..freedrinksPremii.."&Pins="..pinsPremii.."&Chance="..chancePremii,
        };     
        network.request(url,"POST",networkListener, params)
end

local fundal = display.newImage("fundalslot.png")
fundal.x = display.contentCenterX
fundal.y = display.contentCenterY
fundal.yScale=0.4
fundal.xScale=0.4

sceneGroup:insert(fundal)
sceneGroup:insert(loadingText) 
sceneGroup:insert(loadingText2) 

local lf=display.newImage("firepremii.png");
lf.xScale=0.40;
lf.yScale=0.41
lf.x=265;
lf.y=129;

--sceneGroup:insert(casuta)
sceneGroup:insert(lf)
sceneGroup:insert(pickerWheel)

c={}

local function apasaSagetica( event )

local phase=event.phase
    
    if ( "ended" == event.phase ) then
        native.setKeyboardFocus( nil );
        dataPremii=textDate.text;
        local values = pickerWheel:getValues()
        orasPremii=values[1].value;
        locatiePremii=textLocatie.text;
        operatorPremii=textOperator.text;

        ipadPremii=tonumber(textIpad.text);
        iphonePremii=tonumber(textIphone.text);
        watchPremii=tonumber(textWatch.text);
        airpodsPremii=tonumber(textAirpods.text);
        tshirtPremii=tonumber(textTshirt.text);
        walletsPremii=tonumber(textWallet.text);
        freedrinksPremii=tonumber(textFd.text);
        pinsPremii=tonumber(textPins.text);
        chancePremii=tonumber(text2x.text);

        print(ipadPremii)
        print("*****")
        query();
        print("*****")
        print(ipadPremii)
        schimbaScenaSetup();
        composer.removeScene("scenaPremii");
    end
end

local butonBack=widget.newButton
{
    left=150,
    top=-10,
    width=90,
    height=100,
    defaultFile="sagetica.png",
    onEvent=apasaSagetica,
}

butonBack.x=20;
butonBack.y=306;
butonBack.yScale=0.3;
butonBack.xScale=0.4

sceneGroup:insert(butonBack)

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

local datealb= display.newImage("date.png")
datealb.y=162
datealb.x=84
datealb.xScale=0.4
datealb.yScale=0.4

sceneGroup:insert(datealb);

local cityalb= display.newImage("city.png")
cityalb.y=180
cityalb.x=210
cityalb.xScale=0.4
cityalb.yScale=0.4

sceneGroup:insert(cityalb);


local locationalb= display.newImage("location.png")
locationalb.y=180
locationalb.x=84
locationalb.xScale=0.4
locationalb.yScale=0.4
sceneGroup:insert(locationalb);


local operatoralb= display.newImage("operator.png")
operatoralb.y=196
operatoralb.x=97
operatoralb.xScale=0.4
operatoralb.yScale=0.4
sceneGroup:insert(operatoralb);


--baradata
local bara1= display.newImage("bara.png")
bara1.y=161;
bara1.x=205
bara1.yScale=0.37
bara1.xScale=0.32
sceneGroup:insert(bara1);


--baralocatie
local bara2= display.newImage("baramicuta.png")
bara2.y=179;
bara2.x=157
bara2.yScale=0.39
bara2.xScale=0.32
sceneGroup:insert(bara2);

--baraoperator
local bara4= display.newImage("baramicuta.png")
bara4.y=196;
bara4.x=157
bara4.yScale=0.39
bara4.xScale=0.32
sceneGroup:insert(bara4);


local overlay= display.newImage("overlay70.png")
overlay.x=250
overlay.y=193.5
overlay.yScale=0.8
overlay.xScale=0.465
sceneGroup:insert(overlay);


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

--FIELD-URI
--camp data
azi=os.date( "*t" );
textDate=native.newTextField(160,100,160,12)
textDate.size=7;
textDate.font=native.newFont(native.systemFontBold,8);
textDate.y=159;
textDate.x=204
textDate.hasBackground=false;
textDate.text=tostring(azi.month.."/"..azi.day.."/"..azi.year)
textDate:addEventListener("userInput",textDate)
sceneGroup:insert(textDate);


--camp locatie
textLocatie=native.newTextField(160,100,60,12)
textLocatie.size=7;

if locatiePremii ~= nil then
textLocatie.text=tostring(locatiePremii);
else
    textLocatie.text="";
end

textLocatie.font=native.newFont(native.systemFontBold,8);
textLocatie.y=178;
textLocatie.x=154
textLocatie.hasBackground=false;
textLocatie:addEventListener("userInput",tsus)
sceneGroup:insert(textLocatie);


--camp operator
textOperator=native.newTextField(160,100,60,12)
textOperator.size=7;

if operatorPremii ~=nil then 
textOperator.text=tostring(operatorPremii);
else 
    textOperator.text="";
end

textOperator.font=native.newFont(native.systemFontBold,8);
textOperator.y=195;
textOperator.x=154
textOperator.hasBackground=false;
textOperator:addEventListener("userInput",tsus)
sceneGroup:insert(textOperator);

--camp IPAD
textIpad=native.newTextField(160,100,30,12)
textIpad.size=7;
textIpad.text=tostring(ipadPremii)

if ipadPremii ~= nil then 
textIpad.text=ipadPremii
else
    textIpad.text="0"
end

textIpad.font=native.newFont(native.systemFontBold,8);
textIpad.y=223;
textIpad.x=98
textIpad.inputType="number"
textIpad.hasBackground=false;
textIpad:addEventListener("userInput",tsus)
sceneGroup:insert(textIpad);

--camp IPHONE
textIphone=native.newTextField(160,100,30,12)
textIphone.size=7;
textIphone.font=native.newFont(native.systemFontBold,8);
textIphone.text=tostring(iphonePremii)

if iphonePremii ~= nil then 
textIphone.text=iphonePremii
else
    textIphone.text="0"
end

textIphone.inputType="number"
textIphone.y=223;
textIphone.x=152.5
textIphone.hasBackground=false;
textIphone:addEventListener("userInput",tsus)
sceneGroup:insert(textIphone);

--camp WATCH
textWatch=native.newTextField(160,100,30,12)
textWatch.size=7;
textWatch.font=native.newFont(native.systemFontBold,8);
textWatch.text=tostring(watchPremii)

if watchPremii ~= nil then 
textWatch.text=watchPremii
else
    textWatch.text="0"
end

textWatch.inputType="number"
textWatch.y=223;
textWatch.x=208
textWatch.hasBackground=false;
textWatch:addEventListener("userInput",tsus)
sceneGroup:insert(textWatch);

--camp AIRPODS
textAirpods=native.newTextField(160,100,30,12)
textAirpods.size=7;
textAirpods.font=native.newFont(native.systemFontBold,8);
textAirpods.text=tostring(airpodsPremii)

if airpodsPremii ~= nil then 
textAirpods.text=airpodsPremii
else
    textAirpods.text="0"
end

textAirpods.inputType="number"
textAirpods.y=223;
textAirpods.x=263
textAirpods.hasBackground=false;
textAirpods:addEventListener("userInput",tsus)
sceneGroup:insert(textAirpods);

--camp TSHIRT
textTshirt=native.newTextField(160,100,30,12)
textTshirt.size=7;
textTshirt.font=native.newFont(native.systemFontBold,8);
textTshirt.text=tostring(tshirtPremii)

if tshirtPremii ~= nil then 
textTshirt.text=tshirtPremii
else
    textTshirt.text="0"
end

textTshirt.inputType="number"
textTshirt.y=263;
textTshirt.x=98
textTshirt.hasBackground=false;
textTshirt:addEventListener("userInput",tsus)
sceneGroup:insert(textTshirt);

--camp WALLETS
textWallet=native.newTextField(160,100,30,12)
textWallet.size=7;
textWallet.inputType="number"
textWallet.font=native.newFont(native.systemFontBold,8);
textWallet.text=tostring(walletsPremii)

if walletsPremii ~= nil then 
textWallet.text=walletsPremii
else
    textWallet.text="0"
end

textWallet.y=263;
textWallet.x=152.5
textWallet.hasBackground=false;
textWallet:addEventListener("userInput",tsus)
sceneGroup:insert(textWallet);


--camp FREEDRINKS
textFd=native.newTextField(160,100,30,12)
textFd.size=7;
textFd.inputType="number"
textFd.font=native.newFont(native.systemFontBold,8);
textFd.text=tostring(freedrinksPremii)


if freedrinksPremii ~= nil then 
textFd.text= freedrinksPremii
else
    textFd.text="0"
end

textFd.y=263;
textFd.x=208
textFd.hasBackground=false;
textFd:addEventListener("userInput",tsus)
sceneGroup:insert(textFd);

--camp PINS
textPins=native.newTextField(160,100,30,12)
textPins.size=7;
textPins.inputType="number"
textPins.font=native.newFont(native.systemFontBold,8);
textPins.text=tostring(pinsPremii)

if pinsPremii ~= nil then 
textPins.text=pinsPremii
else
    textPins.text="0"
end

textPins.y=263;
textPins.x=263
textPins.hasBackground=false;
textPins:addEventListener("userInput",tsus)
sceneGroup:insert(textPins);

--camp 2X CHANCE
text2x=native.newTextField(160,100,30,12)
text2x.size=7;
text2x.font=native.newFont(native.systemFontBold,8);
text2x.text=tostring(chancePremii)

if chancePremii ~= nil then 
text2x.text=chancePremii
else
    text2x.text="0"
end

text2x.inputType="number"
text2x.y=263;
text2x.x=319
text2x.hasBackground=false;
text2x:addEventListener("userInput",tsus)
sceneGroup:insert(text2x);


local premii= display.newImage("premii.png")
premii.y=250
premii.x=192
premii.xScale=0.4
premii.yScale=0.4
sceneGroup:insert(premii);

 local butonOk=widget.newButton
{
    left=300,
    top=-10,
    width=90,
    height=100,
    defaultFile="okparola.png",
    --overFile="play.png",
    onEvent=apasaOk,
}
butonOk.x=430;
butonOk.y=270;
butonOk.yScale=0.30;
butonOk.xScale=0.55

sceneGroup:insert(butonOk)


 local butonBd=widget.newButton
{
    left=300,
    top=-10,
    width=90,
    height=100,
    defaultFile="preia.png",
    --overFile="play.png",
    onEvent=getLogin,
}
butonBd.x=430;
butonBd.y=230;
butonBd.yScale=0.25;
butonBd.xScale=0.3

sceneGroup:insert(butonBd)


local butonRefresh=widget.newButton
{
    left=300,
    top=-10,
    width=90,
    height=100,
    defaultFile="refresh.png",
    onEvent=getLoginRefresh,
}
butonRefresh.x=430;
butonRefresh.y=195;
butonRefresh.yScale=0.25;
butonRefresh.xScale=0.3

sceneGroup:insert(butonRefresh)

 
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