include std/rand.e
include std/dll.e
include wrapFLTK.ew

function DrawCB()
  atom  w =Fl_WidgetGetW(Win1),
        h =Fl_WidgetGetH(Win1),
        deg = 180
        
  DrawPushClip(0,0,w,h)
  DrawRectFillRGBColor(0,0,w,h,rand(255),rand(255),rand(255))
  
  integer sz
  for font =0 to 15 do
    sz=6 + rand(70)
    DrawSetFont(font, sz)
    
    atom x,y
    for i=0 to 1 do
        DrawSetRGBColor(rand(255),rand(255),rand(255))
        x=rand(w)
        y=rand(h)
        if i=1 then
            DrawStr("DrawStr()", x,y)
        else
            DrawStrRot(deg, "DrawStrRot()", x,y)
            deg+=5
        end if
    end for
  end for
  
  DrawPopClip()
  return 1
end function
  


--for drawing it's a good idea to use a flicker free double buffered window
atom Win1 = Fl_Double_WindowExNew(640,480,"Drawing_2")
Fl_Double_WindowExSetDrawCB (Win1, call_back( routine_id("DrawCB")))
 
Fl_GroupSetResizable(Win1, Win1)
Fl_WindowShow(Win1)
Fl_Run()
