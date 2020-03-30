include std/dll.e
include wrapFLTK.ew

function DrawCB()
    integer x,y,w,h,x2,y2
    x = 0
    y = 0
    w = Fl_WidgetGetW(Win1)
    h = Fl_WidgetGetH(Win1)
    x2 = x + w
    y2 = y + h
    
    DrawPushClip(x,y,w,h)
    
    DrawSetColor(Fl_WHITE) 
    
    DrawRectFill(x,y,w,h)
    DrawSetColor(Fl_RED)
 
    for xx=x to x2 by 10 do
        DrawYXLine(xx,y,h)
    end for
    
    DrawSetColor( Fl_BLUE)
    for yy=y to y2 by 10 do
        DrawXYLine(x,yy,w)
    end for
    
    --restore old clip region
    DrawPopClip()
    
    return 1
end function


atom Win1 = Fl_Double_WindowExNew(320, 240, "Drawing_1")

Fl_Double_WindowExSetDrawCB( Win1, call_back( routine_id("DrawCB")))

Fl_GroupSetResizable(Win1,Win1)

Fl_WindowShow(Win1)
Fl_Run()
