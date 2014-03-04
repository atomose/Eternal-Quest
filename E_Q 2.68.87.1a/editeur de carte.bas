'#3b,"color yellow;backcolor black"
'#3b,"place 760 200"
'#3b,"\ HOUHOUHOU"
    [go]
    nomainwin
    WindowWidth=1020:WindowHeight=600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2) : UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    hb1x=-6:hb1y=422

    [init]
    sprites$ = "perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z hb1"
    for s = 1 to 13
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next
    loadbmp"JB", "bmp\map\maphum18.bmp"
    open "editeur de carte" for graphics_nsb_nf as #3b
    #3b,"background JB"
    #3b,"trapclose [quit]"
    #3b,"addsprite perso1z perso1z"
    #3b,"addsprite perso1s perso1s"
    #3b,"addsprite perso1d perso1d"
    #3b,"addsprite perso1q perso1q"
    #3b,"addsprite hb1 hb1"
    #3b,"addsprite perso1d perso2d perso1d perso4d"
    #3b,"addsprite perso1q perso2q perso1q perso4q"
    #3b,"addsprite perso1s perso2s perso1s perso4s"
    #3b,"addsprite perso1z perso2z perso1z perso4z"
    perso1dx=330 :perso1dy=312
    #3b,"spritexy perso1d ";perso1dx;" ";perso1dy
    #3b,"spritexy hb1 ";hb1x;" ";hb1y
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1q off"
    #3b,"SpriteVisible perso1s off"
    perso1zx=perso1dx:perso1zy=perso1dy:perso1qx=perso1zx:perso1qy=perso1zy:perso1sx=perso1qx:perso1sy=perso1qy
    #3b,"setfocus"
    #3b,"when characterInput [control_touche]"
    #3b,"drawsprites"
    wait


    [control_touche]
    select case
    case asc(right$(Inkey$,1))= _VK_LEFT : gosub [persoq]
    case Inkey$ = "q" : gosub [persoq]
    case Inkey$ = "Q" : gosub [persoq]
    case asc(right$(Inkey$,1))= _VK_RIGHT : gosub [persod]
    case Inkey$ = "d" : gosub [persod]
    case Inkey$ = "D" : gosub [persod]
    case asc(right$(Inkey$,1))= _VK_UP : gosub [persoz]
    case Inkey$ = "z" : gosub [persoz]
    case Inkey$ = "Z" : gosub [persoz]
    case asc(right$(Inkey$,1))= _VK_DOWN : gosub [persos]
    case Inkey$ = "s" : gosub [persos]
    case Inkey$ = "S" : gosub [persos]
    end select


    'if perso1sx<120 and perso1sy>220 then perso1sy=220
    'if perso1qx<120 and perso1qy>220 then perso1qx=120

    if perso1sy>414 then perso1sy=414
    if perso1qx<282 then perso1qx=282
    if perso1dx>642 then perso1dx=642
    if perso1zy<12 then perso1zy=12

    wait

            [persod]
            #3b,"SpriteVisible perso1s off"
            #3b,"SpriteVisible perso1q off"
            #3b,"SpriteVisible perso1z off"
            #3b,"SpriteVisible perso1d on"
            perso1qx=perso1dx : perso1sx=perso1dx : perso1zx=perso1dx
            perso1dx=perso1dx+6
            #3b,"spritexy perso1d ";perso1dx;" ";perso1dy
            #3b, "cyclesprite perso1d 1"
            #3b,"drawsprites"
            return

            [persoq]
            #3b,"SpriteVisible perso1s off"
            #3b,"SpriteVisible perso1d off"
            #3b,"SpriteVisible perso1z off"
            #3b,"SpriteVisible perso1q on"
            perso1dx=perso1qx : perso1sx=perso1qx : perso1zx=perso1qx
            perso1qx=perso1qx-6
            #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
            #3b, "cyclesprite perso1q 1"
            #3b,"drawsprites"
            return

            [persos]
            #3b,"SpriteVisible perso1q off"
            #3b,"SpriteVisible perso1d off"
            #3b,"SpriteVisible perso1z off"
            #3b,"SpriteVisible perso1s on"
            perso1dy=perso1sy : perso1zy=perso1sy : perso1qy=perso1sy
            perso1sy=perso1sy+6
            #3b,"spritexy perso1s ";perso1sx;" ";perso1sy
            #3b, "cyclesprite perso1s 1"
            #3b,"drawsprites"
            return

            [persoz]
            #3b,"SpriteVisible perso1q off"
            #3b,"SpriteVisible perso1d off"
            #3b,"SpriteVisible perso1s off"
            #3b,"SpriteVisible perso1z on"
            perso1dy=perso1zy : perso1qy=perso1zy : perso1sy=perso1zy
            perso1zy=perso1zy-6
            #3b,"spritexy perso1z ";perso1zx;" ";perso1zy
            #3b, "cyclesprite perso1z 1"
            #3b,"drawsprites"
            return

[quit]
close #3b
end


