[load]
nomainwin
WindowWidth = 5 : WindowHeight = 5
UpperLeftX=int((DisplayWidth-WindowWidth)/2)
UpperLeftY=int((DisplayHeight-WindowHeight)/2)
dir$ = "" : file$ = "song.dat"
'open "Stargate Song Manager" for window_nf as #main
if fileExist(dir$,file$) = 0 then
    gosub [gener]
end if

[loading]
timer 250, [dataload]
wait
[dataload]
timer 0
open "song.dat" for input as #song
input #song, music
input #song, saturation
CLOSE #song
if music = 0 then
    if security = 1 then goto [security]
    playwave "music\menu.wav", loop
    security = 1
end if
[security]
if music = 1 then
    playwave ""
    security = 0
end if
if saturation = 1 then
    playwave ""
    security = 0
    'close #main
    end
end if
goto [loading]


[gener]
open "song.dat" for output as #song
music = 0
saturation = 0
print #song, music
print #song, saturation
CLOSE #song
return


function fileExist(dir$,file$)
    dim info$(10, 10)
    files dir$,file$, info$(
    if val(info$(0, 0)) > 0 then
        fileExist = 1
    else
        fileExist = 0
    end if
end function

