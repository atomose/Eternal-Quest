[ini]

lvlHero=1

PV=203 : PVLvL=5
PM=8   : PMLvL=2
atk=25 : atkLvL=3
def=21 : defLvL=3

speed = 1
gold=0
xp=0
XpLvL=int(50*lvlHero)
PA=0

    cube = 0 : rune = 0 : inventaire = 1 : sortbook = 1
    bmpbutton #3b.Indic, "bmp\map\indic.bmp", [rune], LR, 560, 395
    bmpbutton #3b.IndicA, "bmp\map\indic.bmp", [cube], LR, 760, 395
    [go]
    nomainwin
    WindowWidth=1020:WindowHeight=590
    BackgroundColor$ = "black" : ForegroundColor$ = "white"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    sprites$ = "perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z hb1 coffre"
    for s = 1 to 14
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next
    loadbmp"JB", "bmp\map\maphum3.bmp"
    bmpbutton #3b, "bmp\livresort.bmp", [sort], LR, 123, -20

    bmpbutton #3b, "bmp\inventaire.bmp", [inventaire], LR, 123, 35
    open "editeur objet/sort" for graphics_nsb_nf as #3b

    #3b,"background JB"
    #3b,"trapclose [quit]"
    #3b,"addsprite perso1z perso1z"
    #3b,"addsprite perso1s perso1s"
    #3b,"addsprite perso1d perso1d"
    #3b,"addsprite perso1q perso1q"
    #3b,"addsprite coffre coffre"
    #3b,"addsprite hb1 hb1"
    #3b,"addsprite perso1d perso2d perso1d perso4d"
    #3b,"addsprite perso1q perso2q perso1q perso4q"
    #3b,"addsprite perso1s perso2s perso1s perso4s"
    #3b,"addsprite perso1z perso2z perso1z perso4z"
    coffrex=410:coffrey=150:perso1dx=50:perso1dy=300:hb1x=-10:hb1y=408:minimap1x=16:minimap1y=435:curseurx=87:curseury=488
    #3b,"spritexy perso1d ";perso1dx;" ";perso1dy
    #3b,"spritexy hb1 ";hb1x;" ";hb1y
    #3b,"spritexy coffre ";coffrex;" ";coffrey
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1q off"
    #3b,"SpriteVisible perso1s off"
    perso1zx=perso1dx:perso1zy=perso1dy:perso1qx=perso1zx:perso1qy=perso1zy:perso1sx=perso1qx:perso1sy=perso1qy
    #3b,"setfocus"
    #3b,"when characterInput [control_touchec]"
    #3b,"drawsprites"
    wait


    [control_touchec]
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
    case Inkey$ = "I" : gosub [inventaire]
    case Inkey$ = "i" : gosub [inventaire]
    case Inkey$ = "L" :gosub [sort]
    case Inkey$ = "l" :gosub [sort]
    case Inkey$ = "M" :gosub [menu]
    case Inkey$ = "m" :gosub [menu]
    end select
    wait

            [persod]
            #3b,"SpriteVisible perso1s perso1d perso1q perso1z on"
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
            #3b,"SpriteVisible perso1d perso1s perso1z perso1q on"
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
            #3b,"SpriteVisible perso1d perso1z perso1q perso1s on"
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
            #3b,"SpriteVisible perso1d perso1z perso1q perso1s on"
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





'----inventaire-version-2.0-----------------------------------------------------------------------------------------------------------

           [inventaire]
            close #3b
            inventaire = 2
            Global ncx, ncy, lc
            lc = 20
            WindowWidth=1020:WindowHeight = 600
            UpperLeftX=int((DisplayWidth-WindowWidth)/2)
            UpperLeftY=int((DisplayHeight-WindowHeight)/2)
            loadbmp"JB", "bmp\invent.bmp"
            graphicbox #31.map, 0, 0, 1200, 730
            open "Inventaire" for window_nf as #31
            #31,"trapclose [reload]"
            #31.map, "down"
            #31.map, "setfocus; when leftButtonDown [SimpleClick2]"
            Gwidth = CenterX * 2 : Gheight = CenterY * 2
            ncx = int(Gwidth/lc)+1 : ncy = int(Gheight/lc)+1
            #31.map, "drawbmp JB 0 0"
            print #31.map, "background JB"
            print #31.map, "font Times New Roman 10; color white"
            print #31.map, "flush"
            print #31.map, "backcolor black ; place 225 44 ;\"; NameHeaume$
            print #31.map, "backcolor black ; place 225 65 ;\"; NameArmure$
            print #31.map, "backcolor black ; place 205 84 ;\"; NameBras$
            print #31.map, "backcolor black ; place 210 104 ;\"; NameGants$
            print #31.map, "backcolor black ; place 240 126 ;\"; NamePantalon$
            print #31.map, "backcolor black ; place 215 147 ;\"; NameBottes$
            print #31.map, "backcolor black ; place 470 44 ;\"; NameAnneau1$
            print #31.map, "backcolor black ; place 470 76 ;\"; NameAnneau2$
            print #31.map, "backcolor black ; place 470 107 ;\"; NameAmu1$
            print #31.map, "backcolor black ; place 470 140 ;\"; NameAmu2$
            if version = 1 then
            print #31.map, "backcolor black ; place 640 39 ;\"; "P.V : ";PV;" / ";PVTotal
            print #31.map, "backcolor black ; place 640 65 ;\"; "P.M : ";PM;" / ";PMTotal
            print #31.map, "backcolor black ; place 640 102 ;\"; "Attaque : ";atk
            print #31.map, "backcolor black ; place 640 125 ;\"; "Défense : ";def
            print #31.map, "backcolor black ; place 640 155 ;\"; "Monnaie : ";gold
            end if
            if version = 2 then
            print #31.map, "backcolor black ; place 640 39 ;\"; "H.P : ";PV;" / ";PVTotal
            print #31.map, "backcolor black ; place 640 65 ;\"; "P.M : ";PM;" / ";PMTotal
            print #31.map, "backcolor black ; place 640 102 ;\"; "Attack : ";atk
            print #31.map, "backcolor black ; place 640 125 ;\"; "Defense : ";def
            print #31.map, "backcolor black ; place 640 155 ;\"; "Monney : ";gold
            end if
            wait


    [SimpleClick2]
    mX = MouseX
    mY = MouseY
    if mX>int(44*lc) and mX<int((44*lc)+95) and mY>int(1*lc) and mY<int((1*lc)+25) then
        goto [reload]
    end if
    '#31.map, "drawsprites"
    if version = 1 then
            print #31.map, "backcolor black ; place 225 44 ;\"; NameHeaume$
            print #31.map, "backcolor black ; place 225 65 ;\"; NameArmure$
            print #31.map, "backcolor black ; place 205 84 ;\"; NameBras$
            print #31.map, "backcolor black ; place 210 104 ;\"; NameGants$
            print #31.map, "backcolor black ; place 240 126 ;\"; NamePantalon$
            print #31.map, "backcolor black ; place 215 147 ;\"; NameBottes$
            print #31.map, "backcolor black ; place 470 44 ;\"; NameAnneau1$
            print #31.map, "backcolor black ; place 470 76 ;\"; NameAnneau2$
            print #31.map, "backcolor black ; place 470 107 ;\"; NameAmu1$
            print #31.map, "backcolor black ; place 470 140 ;\"; NameAmu2$

            print #31.map, "backcolor black ; place 640 39 ;\"; "P.V : ";PV;" / ";PVTotal
            print #31.map, "backcolor black ; place 640 65 ;\"; "P.M : ";PM;" / ";PMTotal
            print #31.map, "backcolor black ; place 640 102 ;\"; "Attaque : ";atk
            print #31.map, "backcolor black ; place 640 125 ;\"; "Défense : ";def
            print #31.map, "backcolor black ; place 640 155 ;\"; "Monnaie : ";gold
    end if
    wait

[itemrep]
WindowWidth = 200:WindowHeight = 100
UpperLeftX=int((DisplayWidth-WindowWidth)/2)
UpperLeftY=int((DisplayHeight-WindowHeight)/2)
statictext #objet, "Voulez vous prendre cette objet ?", 20, 10, 180, 20
return

'---Livre-des-sortillèges-V2.0----------------------------------------------------------------------------------------------
            [sort]
            close #3b
            sortbook=2
            Global ncx, ncy, lc
            lc = 20
            playwave "music\hit.wav", async
            WindowWidth=1020:WindowHeight = 600
            UpperLeftX=int((DisplayWidth-WindowWidth)/2)
            UpperLeftY=int((DisplayHeight-WindowHeight)/2)
            loadbmp"JB", "bmp\book.bmp"
            graphicbox #32.map, 0, 0, 1200, 730
            open "" for window_nf as #32
            #32,"trapclose [reload]"
            #32.map, "down"
            #32.map, "setfocus; when leftButtonDown [SimpleClick3]"
            Gwidth = CenterX * 2 : Gheight = CenterY * 2
            ncx = int(Gwidth/lc)+1 : ncy = int(Gheight/lc)+1
            #32.map, "drawbmp JB 0 0"
            print #32.map, "background JB"
            print #32.map, "font Times New Roman 10; color white"
            print #32.map, "flush"

            if sort1 = 1 then
                print #32.map, "backcolor black ; place 620 250 ;\"; sort1$;sort1lvl
            end if

            print #32.map, "backcolor black ; place 300 520 ;\"; NumberPageBook;" / "; NumberPageBookTotal

            if version = 1 then
            print #32.map, "backcolor black ; place 620 44 ;\"; "Caractéristiques :"
            print #32.map, "backcolor black ; place 620 70 ;\"; "Niveau : ";lvlHero
            print #32.map, "backcolor black ; place 620 85 ;\"; "Expérience : ";xp
            print #32.map, "backcolor black ; place 620 100 ;\"; "Argent : ";gold
            print #32.map, "backcolor black ; place 620 115 ;\"; "Attaque : ";atk
            print #32.map, "backcolor black ; place 620 130 ;\"; "Defense : ";def
            print #32.map, "backcolor black ; place 620 145 ;\"; "Points de vie : ";PV;" / ";PVTotal
            print #32.map, "backcolor black ; place 620 160 ;\"; "Points de mana : ";PM;" / ";PMTotal
            print #32.map, "backcolor black ; place 620 175 ;\"; "Déplacement : ";speed
            print #32.map, "backcolor black ; place 620 190 ;\"; "Points d'aptitude disponibles : ";PA
            print #32.map, "backcolor black ; place 620 250 ;\"; "Sorts appris :"
            end if

            if version = 2 then
            print #32.map, "backcolor black ; place 620 44 ;\"; "Specifications :"
            print #32.map, "backcolor black ; place 620 70 ;\"; "Level : ";lvlHero
            print #32.map, "backcolor black ; place 620 85 ;\"; "Experience : ";xp
            print #32.map, "backcolor black ; place 620 100 ;\"; "Money : ";gold
            print #32.map, "backcolor black ; place 620 115 ;\"; "Attack : ";atk
            print #32.map, "backcolor black ; place 620 130 ;\"; "Defense : ";def
            print #32.map, "backcolor black ; place 620 145 ;\"; "Life points : ";PV;" / ";PVTotal
            print #32.map, "backcolor black ; place 620 160 ;\"; "Points of mana : ";PM;" / ";PMTotal
            print #32.map, "backcolor black ; place 620 175 ;\"; "MoveSpeed : ";speed
            print #32.map, "backcolor black ; place 620 190 ;\"; "Skill points available : ";PA
            print #32.map, "backcolor black ; place 620 250 ;\"; "Spells learned :"
            end if
            wait


            [SimpleClick3]
            mX = MouseX
            mY = MouseY
            if mX>int(44*lc) and mX<int((44*lc)+95) and mY>int(1*lc) and mY<int((1*lc)+25) then
            goto [reload]
            end if
            print #32.map, "backcolor black ; place 225 44 ;\"; "test"
            wait

            [reload]
            if sortbook=2 then
                close #32
                sortbook=1
                goto [ini]
            end if
            if inventaire=2 then
                close #31
                inventaire=1
                goto [ini]
            end if

'-------------------------------------------------------------------------------------------------

[close]
close #objet
wait

[quit]
close #3b
end

[quit31]
close #31
inventaire=1
wait

[quit32]
close #32
sortbook=1
wait

[w]
wait


