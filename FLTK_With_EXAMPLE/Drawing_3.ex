include std/math.e
include std/task.e
include std/os.e
include std/dll.e
include wrapFLTK.ew


atom gfxPrimitive=0

function Draw1(atom win)
    --select the window as curent drawing target
    Fl_WindowMakeCurrent(win)
    --get position and size of the window
    atom x,y,w,h
    x = 10
    y = 10
    w = Fl_WidgetGetW(win)-20
    h = Fl_WidgetGetH(win)-20
    
    DrawPushClip(x,y,w,h)--any drawing outside this clip region are ingnored
    DrawRectFillColor(x,y,w,h, Fl_WHITE) --fill the whole background
    
    atom r
    integer bt
    for i=1 to 10 do
        DrawSetRGBColor(rand(255),rand(255),rand(255))
        switch gfxPrimitive do
            case 0 then
                DrawPoint(rand(w),rand(h))
            case 1 then
                DrawLine(rand(w),rand(h), rand(w),rand(h))
            case 2 then
                DrawRect(rand(w),rand(h), rand(w),rand(h))
            case 3 then
                r = rand(h/2)
                DrawArc(rand(w),rand(h), r,r,0,360) --circle
            case 4 then
                DrawRectFill(rand(w),rand(h), rand(w), rand(h))
            case 5 then
                bt = 1 + rand(15)
                DrawBox(bt, rand(w),rand(h), rand(w),rand(h), Fl_RGB_Color(rand(255),rand(255),rand(255)))
            case 6 then
                DrawArc(rand(w),rand(h), rand(w),rand(h), 0,360) --oval
        end switch
    end for
    
    DrawPopClip() --restore old clip region 
    gfxPrimitive = mod( gfxPrimitive+1,  7 )
 
    return 0
end function


atom win1 = Fl_Double_WindowNew(640,480, "Drawing 3")
Fl_WindowShow(win1)

atom t 
while 1 do
    --wait for any event with a timeout value
    t = Fl_Wait2(0.05)
    if  Fl_WindowShown(win1)=0 then 
        exit --while
    end if
    
    Draw1(win1)
end while
 

 
 
