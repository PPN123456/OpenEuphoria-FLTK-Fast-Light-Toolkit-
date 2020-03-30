include std/console.e
include std/dll.e
include std/machine.e
include std/types.e

include wrapFLTK.ew

boolean click =1
function ButtonCB () 
    if  click then
        Fl_WidgetCopyLabel( Btn1, "Do it again")
        click = 0
    else
        Fl_WidgetSetLabel( Btn1, "Press")
        click=1
    end if
    return 0
end function

Fl_SetScheme("plastic")

atom Win1 = Fl_WindowNew(320,180, "FLTK Euphoria Wrapper")
atom Btn1 = Fl_ButtonNew(90,90,150,30, "Press")


 
Fl_WidgetSetCallback(Btn1, call_back(routine_id("ButtonCB"))) 

Fl_WindowShow(Win1)
Fl_Run()
 
