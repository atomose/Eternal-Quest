'Creat By UnLiMiTeD Corporation 2011/2014 all copiright reserved

'playmidi "music\music.mid", length
'stopmidi

   ' notice "About" + chr$(13) + "UnLiMiTeD Corporation (C) 2011-2014"

'-----initialisation-------------------------------------------------------------------------------------------------------------------|
    [debut]
    WindowWidth = 1020 :WindowHeight = 600  : version = 1 : NumVersion$ = "Version : 2.68.87.1" : music = 1
    UpperLeftX=int((DisplayWidth-WindowWidth)/2) : UpperLeftY=int((DisplayHeight-WindowHeight)/2)
goto [st]
    loadbmp "JB", "bmp\logo\2.bmp"
    playwave "music\logo1.wav", loop
    open "" for graphics_nsb_nf as #logo
    #logo, "trapclose [quitlogo]"
    #logo,"background JB"
    #logo,"drawsprites"
    timer 5, [debut2]
    wait

    [quitlogo]
    timer 0
    close #logo
    playwave ""
    end

    [debut2]
    unloadbmp "JB"
    loadbmp "JB", "bmp\logo\2.bmp"
    #logo,"background JB"
    #logo,"drawsprites"
    timer 7000, [logo1]
    wait

    [logo1]
    unloadbmp "JB"
    loadbmp "JB", "bmp\logo\1.bmp"
    #logo,"background JB"
    #logo,"drawsprites"
    timer 8000, [logo2]
    wait

    [logo2]
    timer 0
    unloadbmp "JB"
    playwave ""
    timer 500, [logo3]
    wait

    [logo3]
    loadbmp "JB", "bmp\logo\3.bmp"
    #logo,"background JB"
    #logo,"drawsprites"
    timer 8000, [endLogo]
    wait

    [endLogo]
    timer 0
    close #logo
    unloadbmp "JB"
    timer 150, [iniSONG]
    wait

    [iniSONG]
    run "SongGen.exe"
    music = 1
    [st]
    load = 0 : gameD = 1 : questOp = 0 : questM = 0 : game$ = "off" : win = 2
    WindowWidth = 1020 :WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2) : UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    BackgroundColor$ = "black" : ForegroundColor$ = "white"
    nomainwin
    timer 0
    goto [start2]

    [start]
    close #2b
    playwave "music\hit.wav", async

    [start2]
    Global ncx, ncy, lc
    lc = 20
    WindowWidth = 1020 :WindowHeight = 600 : game$ = "off"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2) : UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    if version = 1 then
    loadbmp"JB", "bmp\fond1FR.bmp"
    end if
    if version = 2 then
    loadbmp"JB", "bmp\fond1ENG.bmp"
    end if

    graphicbox #2b.map, 0, 0, 1100, 630

    bmpbutton #2b.son1, "bmp\sonOff.bmp", [son], LR, 940,500
    bmpbutton #2b.son2, "bmp\sonOn.bmp", [son], LR, 940,500
    if version = 1 then
        open "Eternal Quest : les runes de l'apocalypse" for window_nf as #2b
    end if
    if version = 2 then
        open "Eternal Quest : runes of the Apocalypse" for window_nf as #2b
    end if

    #2b, "trapclose [quitSbis]"
    #2b.map, "down"
    #2b.map, "setfocus; when leftButtonDown [SimpleClickStart]"
    #2b.map, "home; posxy CenterX CenterY"
    Gwidth = CenterX * 2 : Gheight = CenterY * 2
    ncx = int(Gwidth/lc)+1 : ncy = int(Gheight/lc)+1
    #2b.map, "drawbmp JB 0 0"
    print #2b.map, "background JB"
    print #2b.map, "flush"
    print #2b.map, "font Times New Roman 10; color black"
    print #2b.map, "backcolor darkgreen ; place 880 550 ;\";" ";NumVersion$;" "
    if music = 1 then
        print #2b.son2, "enable"
        print #2b.son1, "disable"
        open "song.dat" for output as #song
        music = 0
        saturation = 0
        print #song, music
        print #song, saturation
        CLOSE #song
        music = 1
    end if
    if music = 0 then
        print #2b.son2, "disable"
        print #2b.son1, "enable"
        open "song.dat" for output as #song
        music = 1
        saturation = 0
        print #song, music
        print #song, saturation
        CLOSE #song
        music = 0
    end if
    wait

    [SimpleClickStart]
    mX = MouseX
    mY = MouseY
    if mX>int(20*lc) and mX<int((20*lc)+200) and mY>int(4*lc) and mY<int((4*lc)+80) then
        goto [button1Click]
    end if
    if mX>int(20*lc) and mX<int((20*lc)+200) and mY>int(9*lc) and mY<int((9*lc)+80) then
        goto [load]
    end if
    if mX>int(20*lc) and mX<int((20*lc)+200) and mY>int(15*lc) and mY<int((15*lc)+80) then
        goto [system]
    end if
    if mX>int(20*lc) and mX<int((20*lc)+200) and mY>int(21*lc) and mY<int((21*lc)+80) then
        goto [aide]
    end if
    print #2b.map, "flush"
    wait

    [son]
    if music = 1 then
        print #2b.son2, "enable"
        print #2b.son1, "disable"
        open "song.dat" for output as #song
        music = 0
        saturation = 0
        print #song, music
        print #song, saturation
        CLOSE #song
        music = 1
    end if
    if music = 0 then
        print #2b.son2, "disable"
        print #2b.son1, "enable"
        open "song.dat" for output as #song
        music = 1
        saturation = 0
        print #song, music
        print #song, saturation
        CLOSE #song
        music = 0
    end if
    wait


'-----Systeme-------------------------------------------------------------------------------------------------------------------|

        [system]
    if system=1 then [system2]
    if system=2 then
        close #34
    end if
    [system2]
    system=2
    BackgroundColor$ = "white" : ForegroundColor$ = "black"
    'playwave "music\hit.wav", async
    WindowWidth = 270:WindowHeight = 330
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    checkbox #34.cb1, "Fr", [LangueFR], [LangueFR], 110, 10, 40, 20
    checkbox #34.cb2, "Eng", [LangueENG], [LangueENG], 170, 10, 40, 20
    button #34, "?", [nf], UL, 230, 10, 25, 17

    checkbox #34.cb3, "On", [musicOn], [musicOff], 110, 30, 40, 20
    checkbox #34.cb4, "Off", [musicOff], [musicOn], 170, 30, 40, 20
    button #34, "?", [nf], UL, 230, 30, 25, 17

    checkbox #34.cb5, "On", [nf], [nf], 110, 50, 40, 20
    checkbox #34.cb6, "Off", [nf], [nf], 170, 50, 40, 20
    button #34, "?", [nf], UL, 230, 50, 25, 17

    checkbox #34.cb7, "On", [dialogueOn], [dialogueOff], 110, 70, 40, 20
    checkbox #34.cb8, "Off", [dialogueOff], [dialogueOn], 170, 70, 40, 20
    button #34, "?", [nf], UL, 230, 70, 25, 17

    checkbox #34.cb9, "On", [nf], [nf], 110, 90, 40, 20
    checkbox #34.cb10, "Off", [nf], [nf], 170, 90, 40, 20
    button #34, "?", [nf], UL, 230, 90, 25, 17

    checkbox #34.cb11, "On", [nf], [nf], 110, 110, 40, 20
    checkbox #34.cb12, "Off", [nf], [nf], 170, 110, 40, 20
    button #34, "?", [nf], UL, 230, 110, 25, 17

    checkbox #34.cb13, "On", [nf], [nf], 110, 130, 40, 20
    checkbox #34.cb14, "Off", [nf], [nf], 170, 130, 40, 20
    button #34, "?", [nf], UL, 230, 130, 25, 17

    if version = 1 then
    statictext #34, "Langue", 10, 10, 60, 20
    statictext #34, "Musique", 10, 30, 60, 20
    statictext #34, "Bruitage", 10, 50, 60, 20
    statictext #34, "Dialogue", 10, 70, 60, 20
    statictext #34, "Mode rage", 10, 90, 100, 20
    statictext #34, "Astuces", 10, 110, 60, 20
    statictext #34, "Animations", 10, 130, 60, 20
    bmpbutton #34, "bmp\aide\retourOption.bmp", [quit4], LR, 50, 00
    end if
    if version = 2 then
    statictext #34, "Language", 10, 10, 60, 20
    statictext #34, "Music", 10, 30, 60, 20
    statictext #34, "Song", 10, 50, 60, 20
    statictext #34, "Dialogue", 10, 70, 60, 20
    statictext #34, "Rage Mode", 10, 90, 100, 20
    statictext #34, "Tricks", 10, 110, 60, 20
    statictext #34, "Animations", 10, 130, 60, 20
    bmpbutton #34, "bmp\aide\backOption.bmp", [quit4], LR, 50, 00
    end if

    Open "" for window_nf As #34
    if version = 1 then
        print #34.cb1, "set"
        print #34.cb2, "reset"
    end if
    if version = 2 then
        print #34.cb2, "set"
        print #34.cb1, "reset"
    end if

    if music = 1 then
        print #34.cb3, "set"
        print #34.cb4, "reset"
    end if
    if music = 0 then
        print #34.cb4, "set"
        print #34.cb3, "reset"
    end if

    print #34.cb5, "set"
    print #34.cb7, "set"
    print #34.cb10, "set"
    print #34.cb11, "set"
    print #34.cb13, "set"

    #34, "trapclose [quit4]"
    print #34, "font times_new_roman 11"
    wait

   [dialogueOn]
    dialogue = 0
    print #34.cb7, "set"
    print #34.cb8, "reset"
    wait
    [dialogueOff]
    dialogue = 1
    print #34.cb8, "set"
    print #34.cb7, "reset"
    wait

    [LangueFR]
    version = 1
    system=1
    close #34
    if game$ = "on" then [reload]
    close #2b
    unloadbmp "JB"
    if music = 0 then music = 1
    goto [start2]

    [LangueENG]
    version = 2
    system=1
    close #34
    if game$ = "on" then [reload]
    close #2b
    unloadbmp "JB"
    goto [start2]

    [musicOn]
    music = 1
    if map >= 1 then
        playwave "music\music1.wav", loop
        print #34.cb3, "set"
        print #34.cb4, "reset"
        wait
    end if
    print #34.cb3, "set"
    print #34.cb4, "reset"
    goto [son]

    [musicOff]
    music = 0
    playwave ""
    print #34.cb4, "set"
    print #34.cb3, "reset"
    if map >= 1 then wait
    goto [son]

[nf]
wait

'-----Aide---------------------------------------------------------------------------------------------------------------------|

    [retouraide]
    close #3c
    aide=1
    [aide]
    if aide=2 then
        close #3c
    end if
    aide=2
    'playwave "music\hit.wav", async
    WindowWidth = 700:WindowHeight = 600
    BackgroundColor$ = "black" : ForegroundColor$ = "white"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2) : UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    if version = 1 then
        bmpbutton #3c.I2, "bmp\aide\acceuilFR.bmp", [I2], UL, 0, 50
        bmpbutton #3c, "bmp\aide\quetesFR.bmp", [aidequetes], LR, 502, 369
        bmpbutton #3c, "bmp\aide\inventaideFR.bmp", [aideinvent], LR, 502, 243
        bmpbutton #3c, "bmp\aide\sortaideFR.bmp", [aideSorts], LR, 502, 181
        bmpbutton #3c, "bmp\aide\combataideFR.bmp", [aidecombat], LR, 502, 306
        bmpbutton #3c, "bmp\aide\support.bmp", [aidesupport], LR, 501, 118
        bmpbutton #3c, "bmp\aide\retour2FR.bmp", [quit], LR, 501, 10
    end if
    if version = 2 then
        bmpbutton #3c.I2, "bmp\aide\acceuilENG.bmp", [I2], UL, 0, 50
        bmpbutton #3c, "bmp\aide\quetesENG.bmp", [aidequetes], LR, 502, 369
        bmpbutton #3c, "bmp\aide\inventaideENG.bmp", [aideinvent], LR, 502, 243
        bmpbutton #3c, "bmp\aide\sortaideENG.bmp", [aideSorts], LR, 502, 181
        bmpbutton #3c, "bmp\aide\combataideENG.bmp", [aidecombat], LR, 502, 306
        bmpbutton #3c, "bmp\aide\support.bmp", [aidesupport], LR, 501, 118
        bmpbutton #3c, "bmp\aide\retour2ENG.bmp", [quit], LR, 501, 10
    end if

    Open "" for window_nf As #3c
    print #3c, "font Times New Roman 12"
    print #3c.I2, "disable"
    #3c, "trapclose [quit]"
    wait

    [aidequetes]
    close #3c
    playwave "music\hit.wav", async
    bmpbutton #3c.I1, "bmp\aide\AideQuetes.bmp", [I2], LR, 10, 55
    if version = 1 then
    bmpbutton #3c, "bmp\aide\retour2FR.bmp", [retouraide], LR, 480, -10
    end if
    if version = 2 then
    bmpbutton #3c, "bmp\aide\retour2ENG.bmp", [retouraide], LR, 480, -10
    end if
    Open "" for window_nf As #3c
    print #3c.I1, "disable"
    #3c, "trapclose [quit2]"
    wait

    [aideinvent]
    close #3c
    playwave "music\hit.wav", async
    bmpbutton #3c.I1, "bmp\aide\Aideinventaire.bmp", [I2], LR, 10, 35
    if version = 1 then
    bmpbutton #3c, "bmp\aide\retour2FR.bmp", [retouraide], LR, 480, -10
    end if
    if version = 2 then
    bmpbutton #3c, "bmp\aide\retour2ENG.bmp", [retouraide], LR, 480, -10
    end if
    Open "" for window_nf As #3c
    print #3c.I1, "disable"
    #3c, "trapclose [quit2]"
    wait

    [aidecombat]
    close #3c
    playwave "music\hit.wav", async
    bmpbutton #3c.I1, "bmp\aide\Aidecombat.bmp", [I2], LR, 00, 35
    if version = 1 then
    bmpbutton #3c, "bmp\aide\retour2FR.bmp", [retouraide], LR, 480, -10
    end if
    if version = 2 then
    bmpbutton #3c, "bmp\aide\retour2ENG.bmp", [retouraide], LR, 480, -10
    end if
    Open "" for window_nf As #3c
    print #3c.I1, "disable"
    #3c, "trapclose [quit2]"
    wait

    [aideSorts]
    close #3c
    playwave "music\hit.wav", async
    bmpbutton #3c.I1, "bmp\aide\Aidesort.bmp", [I2], LR, 00, 55
    if version = 1 then
    bmpbutton #3c, "bmp\aide\retour2FR.bmp", [retouraide], LR, 480, -10
    end if
    if version = 2 then
    bmpbutton #3c, "bmp\aide\retour2ENG.bmp", [retouraide], LR, 480, -10
    end if
    Open "" for window_nf As #3c
    print #3c.I1, "disable"
    #3c, "trapclose [quit2]"
    wait

    [aidesupport]
    close #3c
    TextboxColor$ = "black"
    playwave "music\hit.wav", async
    if version = 1 then
    statictext #3c.titre, "Mise à jour, bugs et support en ligne", 140, 50, 500, 40
    statictext #3c, "Une aide est a la disposition pour toute personne sur le forum officiel à l'adresse suivante :", 20, 120, 550, 20
    statictext #3c, "Les mises à jours seront disponibles pour la version complète . La version de démonstration ne sera pas mise à jour, sauf si bugs ou améliorations graphiques.", 20, 180, 650, 40
    statictext #3c, "Merci de bien vouloir vérifier votre version et de tenir celle-ci à jour.", 20, 220, 550, 20
    statictext #3c, "Nous tenons à rappeler que ce jeu est gratuit et ne peux être commercialiser de quelques façons.", 20, 240, 550, 20
    end if
    if version = 2 then
    statictext #3c.titre, "Update, bugs and support", 200, 50, 500, 40
    statictext #3c, "Assistance is made available to anyone on the official forum at the following address :", 20, 120, 550, 20
    statictext #3c, "The updates will be available for the full version. The demo version will not be updated unless bugs or graphical improvements.", 20, 180, 650, 40
    statictext #3c, "Thank you kindly check your version and keep it updated.", 20, 220, 550, 20
    statictext #3c, "We remind that this game is free and can't be commercialize by some ways.", 20, 240, 550, 20
    end if
    statictext #3c, "Eternal Quest ® 2011-2014 by Alexandre Lomuto", 220, 420, 550, 20
    textbox #3c.name, 20, 140, 350, 20
    if version = 1 then
    bmpbutton #3c, "bmp\aide\retour2FR.bmp", [retouraide], LR, 480, -10
    end if
    if version = 2 then
    bmpbutton #3c, "bmp\aide\retour2ENG.bmp", [retouraide], LR, 480, -10
    end if
    Open "" for window_nf As #3c
    #3c, "trapclose [quit2]"
    print #3c.name, "http://unlimitedfreewarecor.wix.com/unlimited-website"
    print #3c, "font times_new_roman 10"
    print #3c.titre, "!font times_new_roman 20"
    wait

'--choixPerso--------------------------------------------------------------------------------------

    [button1Click]
    close #2b
    unloadbmp"JB"
    playwave "music\hit.wav", async
    BackgroundColor$ = "black" : ForegroundColor$ = "white"
    WindowWidth = 1020 : WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    loadbmp"JB", "bmp\fond2.bmp"

    'bmpbutton #3b.barre, "bmp\barre1.bmp", [indic1], LR, 599, 305
    'bmpbutton #3b.barre, "bmp\barre1.bmp", [indic1], LR, 598, 255
    'bmpbutton #3b.barre, "bmp\barre1.bmp", [indic1], LR, 599, 203
    'bmpbutton #3b.barre, "bmp\barre1.bmp", [indic1], LR, 599, 150

    if version = 1 then
        bmpbutton #2b.barre, "bmp\barre1.bmp", [indic1], LR, 598, 355
        bmpbutton #2b, "bmp\selectionrace\bouttonhumainFR1.bmp", [indic1], LR, 745, 338
        bmpbutton #2b.selection1, "bmp\selectionrace\race1FR.bmp", [indic1], LR, 117, 30
        bmpbutton #2b.selectionbutton1, "bmp\selectionrace\selectionFR.bmp", [confirmhum], LR, 203, 218
        bmpbutton #2b, "bmp\selectionrace\bouttonelfeFR1.bmp", [indic1], LR, 746, 288
        bmpbutton #2b, "bmp\retour.bmp", [start], UL, 118, 493
    end if

    if version = 2 then
        bmpbutton #2b.barre, "bmp\barre1.bmp", [indic1], LR, 598, 355
        bmpbutton #2b, "bmp\selectionrace\bouttonhumainENG1.bmp", [indic1], LR, 745, 338
        bmpbutton #2b.selection1, "bmp\selectionrace\race1ENG.bmp", [indic1], LR, 117, 30
        bmpbutton #2b.selectionbutton1, "bmp\selectionrace\selectionENG.bmp", [confirmhum], LR, 203, 218
        bmpbutton #2b, "bmp\selectionrace\bouttonelfeENG1.bmp", [indic1], LR, 746, 288
        bmpbutton #2b, "bmp\back.bmp", [start], UL, 118, 493
    end if

    bmpbutton #2b, "bmp\selectionrace\bouttonorcs1.bmp", [indic1], LR, 747, 237
    bmpbutton #2b, "bmp\selectionrace\bouttonogre1.bmp", [indic1], LR, 748, 186
    bmpbutton #2b, "bmp\selectionrace\bouttonNecro1.bmp", [indic1], LR, 748, 135

    open "" for graphics_nsb_nf as #2b
    #2b "when leftButtonMove SimpleClick2"
    print #2b.barre, "disable"
    print #2b.selection1, "disable"
    #2b, "trapclose [quitSbis]"
    #2b,"background JB"
    #2b,"drawsprites"
    if antibug = 1 then [button1Click]
    wait

    [indic1]
    wait

    [confirmhum]
    playwave "music\hit.wav", async
    map1=0
    close #2b
    goto [intro1humain1]

    [intro1humain1]

    NameHeaumeFR$ = "Vide"
    NameArmureFR$ = "Chemise Simple"
    NameBrasFR$ = "Vide"
    NameGantsFR$ = "Vide"
    NamePantalonFR$ = "Bas Simple"
    NameBottesFR$ = "Chaussures simple"
    NameAnneau1FR$ = "Vide"
    NameAnneau2FR$ = "Vide"
    NameAmu1FR$ = "Vide"
    NameAmu2FR$ = "Vide"

    NameHeaumeENG$ = "Empty"
    NameArmureENG$ = "Simple shirt"
    NameBrasENG$ = "Empty"
    NameGantsENG$ = "Empty"
    NamePantalonENG$ = "Simple bottom"
    NameBottesENG$ = "Single shoes"
    NameAnneau1ENG$ = "Empty"
    NameAnneau2ENG$ = "Empty"
    NameAmu1ENG$ = "Empty"
    NameAmu2ENG$ = "Empty"

    lvlHero=1
    campagne=1
    PVTotal = 78 : PMTotal = 18
    PV=78 : PVLvL=4
    PM=18   : PMLvL=2
    atk=14 : atkLvL=3
    def=3 : defLvL=2
    speed = 1
    gold= 35
    xp=0
    XpLvL=int(100*lvlHero)
    PA = 0
    DQop1 = 0

    WindowWidth = 1020:WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2) : UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    if version = 1 then
    text1$ = "Tyliak, ville natale du royaume d'Attaria, bastion de la famille Esarion "_
            +"depuis plus de 11 siècles. "_
            +"                                              Une nuit d'hiver, alors que le temps était clément à une sortie pour "_
            +"admirer les astres, le roi Thère fut sauvagement assassiné dans ses "_
            +"jardins. "_
            +"                                                                                  Vous venez d'apprendre la nouvelle. "_
            +"                                              Laissant votre mère pleurer sur la dépouille de son mari, votre père, vous "_
            +"vous lancez à la poursuite de l'assassin."_
            +"Vous avez appris qu'il se rendait au port par un des gardes. Vous y allez "_
            +"le pas pressant. Une fois arrivé vous ne le trouvez pas mais une veille "_
            +"dame édentelée vous demande quelques pièces en échange de sa direction. "_
            +"Agacé, vous lui donnez puis elle vous montre du bout du doigt un petit "_
            +"navire de pêche qui s'éloigne du port. "_
            +"Sans attendre vous réquisitionnez un navire et vous vous lancez à sa poursuite..."
    end if

    if version = 2 then
    text1$ = "Tyliak, birthplace of the Kingdom of Attaria, bastion of Esarion family "_
            +"for over 11 century. "_
            +"                                                            A winter night, when the weather was at an outlet to "_
            +"admire stars, the king there was brutally murdered in his gardens. "_
            +"                       You have just heard the news. "_
            +"                                              Leaving your mother crying over the body of her husband, your father, "_
            +"you start to pursuit of the murderer."_
            +"You have heard that it was going to port one of the guards. Your going. "_
            +"le pas pressant. Une fois arrivez-vous ne le trouvez pas mais une veille "_
            +"Once you arrive not find but an old lady ask you a few coins in exchange for his direction. "_
            +"Annoyed, you gave him then it shows you the finger "_
            +"a small fishing vessel away from the port. "_
            +"Without waiting for you commandeer a ship and you run after him ..."
    end if

    bmpbutton #3b.I2, "bmp\intro1aHum.bmp", [I2], LR, 800,-30
    bmpbutton #3b.I3, "bmp\intro1bHum.bmp", [I2], LR, -50,-30
    statictext #3b.texteSP1,text1$, 255, 170, 500, 300
    if version = 1 then
    statictext #3b.texte, "Campagne Humaine", 410, 20, 250, 50
    bmpbutton #3b, "bmp\suivant.bmp", [intro1humain2], UL, 670, 490
    end if
    if version = 2 then
    statictext #3b.texte, "Human Campaign", 410, 20, 250, 50
    bmpbutton #3b, "bmp\next.bmp", [intro1humain2], UL, 670, 490
    end if
    statictext #3b.texte2, "Acte I", 480, 100, 150, 50
    Open "" for window_nf As #3b
    print #3b.I2, "disable"
    print #3b.I3, "disable"
    print #3b.texte, "!font Times New Roman 20"
    print #3b.texte2, "!font Times New Roman 24"
    print #3b.texteSP1, "!font Times New Roman 14"
    #3b, "trapclose [quitS]"
    wait

    [intro1humain2]
    close #3b
    playwave "music\hit.wav", async

    intro = 1
    if version = 1 then
    text2$ = "La nuit fût longue, le vent glacial. Le navire tangue dangereusement et "_
            +"vous n'apercevez plus le navire de pêche... "_
            +"Un craquement sourd se fait entendre, puis un autre. "_
            +"Une forte bourrasque gonfle les voiles et soulève le bateau de l'eau, le "_
            +"faisant retomber plusieurs mètres plus loin. Le mât s'arrache, les planches "_
            +"éclatent les unes après les autres. L'eau s'infiltre en quelques secondes. "_
            +"Une dernière vague fini le travail et vous entraine vers les abysses de l'océan... "_
            +"                                                                                                         "_
            +"Un vent doux, des grains de sable sous les doigts, de l'air dans les poumons. "_
            +"Vous émergez douloureusement de votre pénible voyage sur une côte inconnue. "_
            +"Après quelques minutes accroupis à reprendre vos esprits vous prenez votre "_
            +"courage à deux mains puis partez en reconnaissance. "_
            +"Le soleil est au zénith mais en cette période vous savez qu'il ne vous reste "_
            +"que quelques heures avant qu'il ne fasse nuit. "_
            +"Une fois la côte explorée, vous pénétrez dans une forêt dense jusqu'à y trouver "_
            +"une prairie dégagée et vous y installez. "_
            +"Vous y confectionnez une tente avec ce que vous avez trouvez en chemin, puis "_
            +"vous allumez un feu pour éloigner les prédateurs durant la nuit. "_
            +"Lorsque celle-ci se présente à vous, vous sombrez rapidement dans le sommeil. "_
            +"                                           Une nouvelle journée commence... "
    end if

    if version = 2 then
    text2$ = "The night was long , the icy wind. The ship is pitching dangerously "_
            +"and you no longer can see the fishing vessel ... "_
            +"A loud crack that was heard, then another. "_
            +"A strong gust fills the sails and raise the boat from the water , making it "_
            +"fall several meters away. The mat is hard , planks burst one after the other."_
            +"Water seeping in seconds . A final wave and finished the job takes you to "_
            +"the depths of the ocean ... "_
            +"                                                                                               "_
            +"A gentle wind, sand under your fingers , the air in the lungs. You emerge "_
            +"from your painfully arduous journey on an unknown coast. After a few minutes"_
            +"crouched take your minds you take your courage in both hands and then go "_
            +"on recognition. The sun is at its zenith but this time you know that"_
            +"you only have a few hours before they face night."_
            +"que quelques heures avant qu'il ne face nuit. "_
            +"Once explored the coast, you enter a dense forest to find a clear or you "_
            +"installed your meadow. "_
            +"You crafted a tent with what you find along the way, then you light a"_
            +"fire to keep predators away overnight. When it comes to you , you fall "_
            +"fast asleep.                                           "_
            +"                                                            A new day begins ... "
    end if

    bmpbutton #3b.I2, "bmp\intro1cHum.bmp", [I2], LR, 800,-30
    bmpbutton #3b.I3, "bmp\intro1dHum.bmp", [I2], LR, -50,-30
    if version = 1 then
    bmpbutton #3b, "bmp\suivant.bmp", [starthum1], UL, 670, 490
    end if
    if version = 2 then
    bmpbutton #3b, "bmp\next.bmp", [starthum1], UL, 670, 490
    end if
    statictext #3b.texteSP2,text2$, 255, 30, 500, 450
    Open "" for window_nf As #3b
    print #3b.I2, "disable"
    print #3b.I3, "disable"
    print #3b.texteSP2, "!font Times New Roman 14"
    #3b, "trapclose [quitS]"
    wait

    [starthum1]
    close #3b
    playwave "music\hit.wav", async
    goto[map1intro]

'-----maps-------------------------------------------------------------------------------------------------------------------|

    [map1intro]

    if version = 1 then
    textINTRO$ = "Bonjour et bienvenue dans le test de la version Alpha 1 de                  ''Eternal Quest : les runes de l'apocalypse''. "+_
                   "                                                   En utilisant cette version Alpha 1, vous vous "+_
                   "engagez à donner toute information concernant des bugs/oublis/fautes de traduction et tout autre problème "+_
                   "que vous rencontrerez lors du déroulement de votre aventure. "+_
                   "                                                                                                          Une "+_
                   "adresse vous est donnée dans le menu ''aide\support'' du jeu afin de pouvoir nous transmettre les informations."+_
                   "                                                    "+_
                   "                                                                                                                              "+_
                   "Merci de votre soutient et bonne aventure!"
    end if
    if version = 2 then
    textINTRO$ = "Hello and welcome to test the Alpha 1 release of                                     ''Eternal Quest: Runes of the Apocalypse''. "+_
                   "                                                   En utilisant cette version Alpha 1, vous vous "+_
                   "engagez à donner toutes informations concernant des bugs/oublis/fautes de traduction et tout autres problèmes "+_
                   "que vous rencontrerez lors du déroulement de votre aventure. "+_
                   "                                                                                                          Une "+_
                   "adresse vous es donner dans le menu ''aide\support'' du jeu afin de pouvoir nous transmettre les informations."+_
                   "                                                                            "+_
                   "Merci de votre soutient et bonne aventure!"
    end if

'By using this Alpha version 1, you agree to any information regarding bugs / oversights / errors translation and any other problems you encounter during the course of your adventure.

                     'notice "Alpha 1 Test 1 : Notice et explication" + chr$(13) + textINTRO$

    openW = 0
    load = 0
    gameD = 0
    perso1qx=642:perso1qy=126
    music = 1
    saturation = 1
    open "song.dat" for output as #song
    print #song, music
    print #song, saturation
    CLOSE #song
    if music = 1 then playwave "music\music1.wav", loop
    goto [jeuhumain1]

    [turnOff]
    timer 0
    intro = 2
    if inventaire = 2 then wait
    if sortbook = 2 then wait
    if version = 1 then
    #3b,"SpriteVisible act1FR off"
    end if
    if version = 2 then
    #3b,"SpriteVisible act1ENG off"
    end if
    #3b,"drawsprites"
    wait

    [map1]
    load = 0 : game$ = "on"
    sprites$ = "act1FR act1ENG minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 Q1"
    for s = 1 to 17
        unloadbmp word$(sprites$,s)
    next
    unloadbmp "JB"
    #3b,"SpriteVisible Q1 off"

    [jeuhumain1]
    gosub[closeSecur]
    WindowWidth = 1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap1x=16:minimap1y=447:hb1x=-6:hb1y=422:curseurx=55:curseury=530:map=1:secteur=1
    act1FRx=310:act1FRy=150:act1ENGx=act1FRx:act1ENGy=act1FRy


    loadbmp"JB", "bmp\map\maphum1.bmp"
    sprites$ = "act1FR act1ENG minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 Q1"
    for s = 1 to 18
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map1 = 1 and load = 0 then gosub[map1a]

    gosub[mapreg1]
    #3b,"addsprite minimap1 minimap1"
    #3b,"addsprite act1FR act1FR"
    #3b,"addsprite act1ENG act1ENG"
    #3b,"spritexy minimap1 ";minimap1x;" ";minimap1y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"spritexy act1FR ";act1FRx;" ";act1FRy
    #3b,"spritexy act1ENG ";act1ENGx;" ";act1ENGy
    #3b,"SpriteVisible perso1s off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible act1ENG off"
    #3b,"SpriteVisible act1FR off"
    if version = 1 and intro = 1 then
        #3b,"SpriteVisible act1FR on"
        #3b,"SpriteVisible act1ENG off"
        timer 2500, [turnOff]
    end if
    if version = 2 and intro = 1 then
        #3b,"SpriteVisible act1ENG on"
        #3b,"SpriteVisible act1FR off"
        timer 2500, [turnOff]
    end if
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchea]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map1a]
    perso1sx=180:perso1sy=30
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_touchea]
    #3b,"when characterInput [I2]"
    timer 120, [1a]
    wait
    [1a]
    timer 0
    #3b,"when characterInput [control_touchea]"
    gosub[case]
    #3b,"SpriteVisible act1FR off"
    #3b,"SpriteVisible act1ENG off"
    if perso1dy <102 and perso1dx=258 then perso1dx=252
    if perso1zx >252 and perso1zy=102 then perso1zy=108
    if perso1dy <162 and perso1dx=324 then perso1dx=318
    if perso1zx >318 and perso1zx <500 and perso1zy=162 then perso1zy=168
    if perso1dy <222 and perso1dx=390 then perso1dx=384
    if perso1zx >384 and perso1zx <576 and perso1zy=222 then perso1zy=228
    if perso1qy <222 and perso1qx=570 then perso1qx=576
    if perso1dy <132 and perso1dx=720 then perso1dx=714
    if perso1zx >714 and perso1zy=132 then perso1zy=138
    if perso1qy <320 and perso1qx=144 then perso1qx=150
    if perso1sx <168 and perso1sy=282 then perso1sy=276
    if perso1qy >276 and perso1qx=174 then perso1qx=180
    if perso1sx <240 and perso1sy=330 then perso1sy=324
    if perso1qy >324 and perso1qx=240 then perso1qx=246
    if perso1sx <372 and perso1sy=348 then perso1sy=342
    if perso1qy >342 and perso1qx=372 then perso1qx=378
    if perso1sx <582 and perso1sy=366 then perso1sy=360
    if perso1dy >306 and perso1dx=582 then perso1dx=576
    if perso1sx >576 and perso1sy=306 then perso1sy=300
    if perso1sx >660 and perso1sy=312 then perso1sy=318
    if perso1qy >306 and perso1qx=660 then perso1qx=666
    if perso1sx >660 and perso1sy=330 then perso1sy=324
    if perso1dy >258 and perso1dx=732 then perso1dx=726
    if perso1sx >726 and perso1sx <786 and perso1sy=264 then perso1sy=258
    if perso1qy >258 and perso1qx=792 then perso1qx=798
    if perso1dy >282 and perso1dx=822 then perso1dx=816
    if perso1sx >816 and perso1sy=288 then perso1sy=282
    if perso1dy >102 and perso1dx=840 then perso1dx=834
    if perso1zx >792 and perso1zy=150 then perso1zy=156
    if perso1dy <150 and perso1dx=792 then perso1dx=786
    if perso1zx >100 and perso1zx <300 and perso1zy<20 then [map2bis]
    wait


'carte 2 ---------------------------------------------------------------


    [map2bis]
    map1=1:map2=0:load=0
    [map2]
    load=0
    sprites$ = "minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 Q1"
    for s = 1 to 16
        unloadbmp word$(sprites$,s)
    next
    unloadbmp "JB"

    [jeuhumain2]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight=600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap1x=16:minimap1y=447:hb1x=-6:hb1y=422:curseurx=55:curseury=508:map=2

    loadbmp"JB", "bmp\map\maphum2.bmp"
    sprites$ = "minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 Q1"
    for s = 1 to 16
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map2= 0 and load = 0 then gosub[map2a]
    if map2= 1 and load = 0 then gosub[map2b]
    gosub[mapreg1]
    Q1x=740:Q1y=140
    #3b,"addsprite minimap1 minimap1"
    #3b,"spritexy minimap1 ";minimap1x;" ";minimap1y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"addsprite Q1 Q1"
    #3b,"spritexy perso1z ";perso1zx;" ";perso1zy
    #3b,"spritexy Q1 ";Q1x;" ";Q1y
    #3b,"SpriteVisible perso1s off"
    #3b,"SpriteVisible perso1q off"
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible Q1 on"
    #3b,"when characterInput [control_toucheb]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map2a]
    perso1zx=198:perso1zy=360
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map2b]
    perso1qx=960:perso1qy=210
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return

    [control_toucheb]
    #3b,"when characterInput [I2]"
    timer 120, [1b]
    wait
    [1b]
    timer 0
    #3b,"when characterInput [control_toucheb]"
    gosub[case]

    if perso1zx >720 and perso1zx < 800 and perso1zy < 187 and DQop1 = 0 then [DQop1]
    if perso1dy >336 and perso1dx=522 then perso1dx=516
    if perso1sx >522 and perso1sx <606 and perso1sy=342 then perso1sy=336
    if perso1qy >342 and perso1qx=600 then perso1qx=606
    if perso1dy >258 and perso1dx=660 then perso1dx=654
    if perso1sx >660 and perso1sx <756 and perso1sy=264 then perso1sy=258
    if perso1qy >264 and perso1qx=756 then perso1qx=762
    if perso1sx >750 and perso1sy=294 then perso1sy=288
    if perso1qy >294 and perso1qx=810 then perso1qx=816
    if perso1sx >780 and perso1sy=342 then perso1sy=336
    if perso1dy >270 and perso1dx=852 then perso1dx=846
    if perso1sx >852 and perso1sy=276 then perso1sy=270
    if perso1zx >600 and perso1zy=186 then perso1zy=192
    if perso1dy <186 and perso1dx=606 then perso1dx=600
    if perso1zx >414 and perso1zy=114 then perso1zy=120
    if perso1qy <240 and perso1qx=420 then perso1qx=426
    if perso1zx >342 and perso1zx <420 and perso1zy=234 then perso1zy=240
    if perso1qy <330 and perso1qx=348 then perso1qx=354
    if perso1zx >276 and perso1zx <348 and perso1zy=324 then perso1zy=330
    if perso1dy <324 and perso1dx=282 then perso1dx=276
    if perso1zx >228 and perso1zx <300 and perso1zy=210 then perso1zy=216
    if perso1dy <210 and perso1dx=234 then perso1dx=228
    if perso1zx >186 and perso1zx <246 and perso1zy=144 then perso1zy=150
    if perso1qy <240 and perso1qx=186 then perso1qx=192
    if perso1zx <186 and perso1zy=234 then perso1zy=240
    if perso1qy <396 and perso1qx=096 then perso1qx=102
    if perso1sy>390 then perso1sy=390
    if perso1dx>978 then perso1dx=978
    if perso1sx <350 and perso1sy>380 then [map1]
    if perso1dy >100 and perso1dx>975 then [map3bis]
    wait



'carte 3 ---------------------------------------------------------------


    [map3bis]
    map2=1:map3=0:openW = 1
    #3b,"SpriteVisible Q1 off"
    [map3]
    load=0
    sprites$ = "minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next
    unloadbmp "JB"

    [jeuhumain3]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap1x=16:minimap1y=447:hb1x=-6:hb1y=422:curseurx=87:curseury=498:map=3

    loadbmp"JB", "bmp\map\maphum3.bmp"
    sprites$ = "minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 Q1 voleur"
    for s = 1 to 17
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next
    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map3=0 and load = 0 then gosub[map3a]
    if map3=1 and load = 0 then gosub[map3b]
    gosub[mapreg1]
    #3b,"addsprite minimap1 minimap1"
    #3b,"spritexy minimap1 ";minimap1x;" ";minimap1y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1d ";perso1dx;" ";perso1dy
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1q off"
    #3b,"SpriteVisible perso1s off"
    #3b,"when characterInput [control_touchec]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map3a]
    perso1dx=30:perso1dy=318
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return
    [map3b]
    perso1sx=594:perso1sy=42
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_touchec]
    #3b,"when characterInput [I2]"
    timer 120, [1c]
    wait
    [1c]
    timer 0
    #3b,"when characterInput [control_touchec]"
    gosub[case]
    if perso1sx<255 and perso1sy>390 then perso1sy=390
    if perso1sx>255 and perso1sy>408 then perso1sy=408
    if perso1qy>390 and perso1qx<255 then perso1qx=255
    if perso1zx<050 and perso1zy=270 then perso1zy=276
    if perso1zx>084 and perso1zx<400 and perso1zy=270 then perso1zy=276
    if perso1qy<270 and perso1qx=048 then perso1qx=054
    if perso1dy<270 and perso1dx=090 then perso1dx=084
    if perso1zx<200 and perso1zy=192 then perso1zy=198
    if perso1qy<270 and perso1qx=390 then perso1qx=396
    if perso1zx<430 and perso1zy=120 then perso1zy=126
    if perso1qy<120 and perso1qx=426 then perso1qx=432
    if perso1zx<550 and perso1zy=060 then perso1zy=066
    if perso1qy<066 and perso1qx=546 then perso1qx=552
    if perso1dy<066 and perso1dx=750 then perso1dx=744
    if perso1zx>744 and perso1zy=066 then perso1zy=072
    if perso1dy<260 and perso1dx=810 then perso1dx=804
    if perso1sx>792 and perso1sy=258 then perso1sy=252
    if perso1dy>252 and perso1dx=792 then perso1dx=786
    if perso1sx>732 and perso1sy=282 then perso1sy=276
    if perso1dy>276 and perso1dx=732 then perso1dx=726
    if perso1sx>612 and perso1sy=342 then perso1sy=336
    if perso1dy>336 and perso1dx=618 then perso1dx=612
    if perso1qy >100 and perso1qx<020 then [map2]
    if perso1zx >500 and perso1zy<020 then [map4bis]
    wait



'carte 4 ---------------------------------------------------------------


    [map4bis]
    map3=1:map4=0:load=0:openW = 1
    goto[map4]

    [map4fix]
    #3b,"SpriteVisible voleur off"
    [map4]
    load=0
    sprites$ = "minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 voleur"
    for s = 1 to 16
        unloadbmp word$(sprites$,s)
    next
    unloadbmp "JB"

    [jeuhumain4]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap1x=16:minimap1y=447:hb1x=-6:hb1y=422:curseurx=89:curseury=477:map=4
    QvoleurSecur = 1

    loadbmp"JB", "bmp\map\maphum4.bmp"
    sprites$ = "minimap1 minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 voleur"
    for s = 1 to 17
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map4=0 and load = 0 then gosub[map4a]
    if map4=1 and load = 0 then gosub[map4b]
    gosub[mapreg1]
    #3b,"addsprite minimap1 minimap1"
    #3b,"spritexy minimap1 ";minimap1x;" ";minimap1y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1z ";perso1zx;" ";perso1zy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1q off"
    #3b,"SpriteVisible perso1s off"
    #3b,"when characterInput [control_touched]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map4a]
    perso1zx=540:perso1zy=390
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map4b]
    perso1dx=030:perso1dy=210
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return

    [control_touched]
    #3b,"when characterInput [I2]"
    timer 90, [1d]
    wait
    [1d]
    timer 0
    #3b,"when characterInput [control_touched]"
    gosub[case]


    if perso1sx>255 and perso1sy>408 then perso1sy=408
    if perso1qy>360 and perso1qx=330 then perso1qx=336
    if perso1sx<336 and perso1sy=360 then perso1sy=354
    if perso1qy>324 and perso1qx=210 then perso1qx=216
    if perso1sx<216 and perso1sy=324 then perso1sy=318
    if perso1qy>246 and perso1qx=120 then perso1qx=126
    if perso1sx<126 and perso1sy=246 then perso1sy=240
    if perso1dy>270 and perso1dx=768 then perso1dx=762
    if perso1zx>726 and perso1zy=282 then perso1zy=288
    if perso1dy<282 and perso1dx=726 then perso1dx=720
    if perso1zx>684 and perso1zy=240 then perso1zy=246
    if perso1dy<240 and perso1dx=684 then perso1dx=678
    if perso1zx>552 and perso1zy=192 then perso1zy=198
    if perso1dy<192 and perso1dx=552 then perso1dx=546
    if perso1zx<600 and perso1zy=072 then perso1zy=078
    if perso1qy<102 and perso1qx=156 then perso1qx=162
    if perso1zx<162 and perso1zy=102 then perso1zy=108
    if perso1qy<162 and perso1qx=120 then perso1qx=126
    if perso1zx<120 and perso1zy=162 then perso1zy=168
    if perso1qx >300 and perso1qy>400 then [map3]
    if perso1qy <388 and perso1qx<020 then [map5bis]
    wait


'carte 5 ---------------------------------------------------------------


    [map5bis]
    map4=1:map5=0:openW = 1
    [map5]
    load=0
    sprites$ = "minimap1 minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 16
        unloadbmp word$(sprites$,s)
    next
    unloadbmp "JB"

    [jeuhumain5]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap1x=16:minimap1y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=466:map=5:queteOption1x=320:queteOption1y=200

    loadbmp"JB", "bmp\map\maphum5.bmp"
    sprites$ = "minimap1 minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 voleur Qop1Gagner Qop1Perdu Qop1Win "+_
               "Qop1Lose"
    for s = 1 to 21
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map5=0 and load = 0 and QvoleurSecur = 1 then gosub[map5a]
    if map5=1 and load = 0 and QvoleurSecur = 1 then gosub[map5b]
    QvoleurSecur = 0

    gosub[mapreg1]

    voleurx=400:voleury=30
    if Qvoleur = 1 or Qvoleur = 2 then perso1zx=396:perso1zy=54
    #3b,"addsprite minimap1 minimap1"
    #3b,"addsprite minimap2 minimap2"
    #3b,"addsprite curseur curseur"
    #3b,"addsprite voleur voleur"
    #3b,"addsprite Qop1Gagner Qop1Gagner"
    #3b,"addsprite Qop1Perdu Qop1Perdu"
    #3b,"addsprite Qop1Win Qop1Win"
    #3b,"addsprite Qop1Lose Qop1Lose"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy Qop1Gagner ";queteOption1x;" ";queteOption1y
    #3b,"spritexy Qop1Perdu ";queteOption1x;" ";queteOption1y
    #3b,"spritexy Qop1Win ";queteOption1x;" ";queteOption1y
    #3b,"spritexy Qop1Lose ";queteOption1x;" ";queteOption1y
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"spritexy voleur ";voleurx;" ";voleury
    #3b,"spritexy minimap1 ";minimap1x;" ";minimap1y
    #3b,"spritexy minimap2 ";minimap1x;" ";minimap1y
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    #3b,"SpriteVisible perso1s off"
    if win = 2 then
        #3b,"SpriteVisible Qop1Perdu off"
        #3b,"SpriteVisible Qop1Gagner off"
        #3b,"SpriteVisible Qop1Lose off"
        #3b,"SpriteVisible Qop1Win off"
    if Qvoleur = 0 then goto [SacocheFix]
    if Qvoleur = 1 then
        #3b,"SpriteVisible voleur off"
    end if
    else
        [SacocheFix]
        #3b,"SpriteVisible voleur on"
    end if
    if win = 1 then
        if version = 1 then
            #3b,"SpriteVisible Qop1Gagner on"
            #3b,"SpriteVisible Qop1Perdu off"
            #3b,"SpriteVisible Qop1Lose off"
            #3b,"SpriteVisible Qop1Win off"
        end if
        if version = 2 then
            #3b,"SpriteVisible Qop1Win on"
            #3b,"SpriteVisible Qop1Lose off"
            #3b,"SpriteVisible Qop1Perdu off"
            #3b,"SpriteVisible Qop1Gagner off"
        end if
        if inventaire = 2 then wait
        if sortbook = 2 then wait
        timer 3000, [winSacoche]
    end if
    if win = 0 then
        if version = 1 then
            #3b,"SpriteVisible Qop1Perdu on"
            #3b,"SpriteVisible Qop1Gagner off"
            #3b,"SpriteVisible Qop1Lose off"
            #3b,"SpriteVisible Qop1Win off"
        end if
        if version = 2 then
            #3b,"SpriteVisible Qop1Lose on"
            #3b,"SpriteVisible Qop1Win off"
            #3b,"SpriteVisible Qop1Perdu off"
            #3b,"SpriteVisible Qop1Gagner off"
        end if
        if inventaire = 2 then wait
        if sortbook = 2 then wait
        timer 3000, [loseSacoche]
    end if
    [fixWinVoleur]
    #3b,"SpriteVisible minimap2 off"
    #3b,"SpriteVisible minimap1 on"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchee]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map5a]
    perso1qx=960:perso1qy=340
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return
    [map5b]
    perso1sx=240:perso1sy=30
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [winSacoche]
    timer 0
    notice "ok"
    if version = 1 then
        #3b,"SpriteVisible Qop1Gagner off"
        #3b,"SpriteVisible voleur off"
    end if
    if version = 2 then
        #3b,"SpriteVisible Qop1Win off"
        #3b,"SpriteVisible voleur off"
    end if
    #3b,"when characterInput [control_touchee]"
    #3b,"drawsprites"
    goto [fixWinVoleur]
    [loseSacoche]
    timer 0
    if version = 1 then
        #3b,"SpriteVisible Qop1Perdu off"
        #3b,"SpriteVisible voleur off"
    end if
    if version = 2 then
        #3b,"SpriteVisible Qop1Lose off"
        #3b,"SpriteVisible voleur off"
    end if
    #3b,"when characterInput [control_touchee]"
    #3b,"drawsprites"
    goto [fixWinVoleur]

    [control_touchee]
    #3b,"when characterInput [I2]"
    timer 90, [1e]
    wait
    [1e]
    timer 0
    #3b,"when characterInput [control_touchee]"
    gosub[case]
    #3b,"SpriteVisible Qop1Gagner off"
    #3b,"SpriteVisible Qop1Perdu off"
    #3b,"SpriteVisible Qop1Win off"
    #3b,"SpriteVisible Qop1Lose off"
    if win = 0 or win = 1 then #3b,"SpriteVisible voleur off"
    if perso1sx>732 and perso1sy>390 then perso1sy=390
    if perso1dy>390 and perso1dx=738 then perso1dx=732
    if perso1sx>255 and perso1sy>414 then perso1sy=414
    if perso1qy>360 and perso1qx=480 then perso1qx=486
    if perso1sx<486 and perso1sy>360 then perso1sy=360
    if perso1qy>300 and perso1qx=270 then perso1qx=276
    if perso1sx<276 and perso1sx>198 and perso1sy>300 then perso1sy=300
    if perso1dy>300 and perso1dx=198 then perso1dx=192
    if perso1sx<200 and perso1sy>318 then perso1sy=318
    if perso1qy>210 and perso1qx=132 then perso1qx=138
    if perso1sx<138 and perso1sy>210 then perso1sy=210
    if perso1qy<240 and perso1qx=102 then perso1qx=108
    if perso1zx<138 and perso1zy<090 then perso1zy=090
    if perso1qy<090 and perso1qx=132 then perso1qx=138
    if perso1dy<168 and perso1dx=522 then perso1dx=516
    if perso1zx>516 and perso1zy<168 then perso1zy=168
    if perso1dy<228 and perso1dx=552 then perso1dx=546
    if perso1zx>552 and perso1zy<228 then perso1zy=228
    if perso1dy<258 and perso1dx=768 then perso1dx=762
    if perso1zx>762 and perso1zx<858 and perso1zy<258 then perso1zy=258
    if perso1qy<258 and perso1qx=852 then perso1qx=858
    if perso1zx>360 and perso1zy<018 then perso1zy=18
    if perso1dy >100 and perso1dx>980 then [map4fix]
    if perso1zx<360 and perso1zy<018 then [map6bis]
    if perso1zx> 390 and perso1zx< 420 and perso1zy < 62 and DQop1 = 1 and Qvoleur = 0 then [Q1voleur]
    wait


'carte 6 ---------------------------------------------------------------


    [map6bis]
    map5=1:map6=0:openW = 1
    [map6fix]
    #3b,"SpriteVisible voleur off"
    [map6]
    load=0
    sprites$ = "minimap1 minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 voleur"
    for s = 1 to 17
        unloadbmp word$(sprites$,s)
    next
    unloadbmp "JB"

    [jeuhumain6]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=48:curseury=550:map=6
    QvoleurSecur = 1

    loadbmp"JB", "bmp\map\maphum6.bmp"
    sprites$ = "minimap2 minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 voleur"
    for s = 1 to 17
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map6=0 and load = 0 then gosub[map6a]
    if map6=1 and load = 0 then gosub[map6b]
    if map6=2 and load = 0 then gosub[map6c]
    gosub[mapreg1]
    #3b,"addsprite minimap1 minimap1"
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"spritexy minimap1 ";minimap1x;" ";minimap1y
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    #3b,"SpriteVisible minimap1 off"
    #3b,"SpriteVisible minimap2 on"
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    #3b,"when characterInput [control_touchef]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map6a]
    perso1zx=330:perso1zy=372
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map6b]
    perso1sx=264:perso1sy=030
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map6c]
    perso1qx=900:perso1qy=078
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return

    [control_touchef]
    #3b,"when characterInput [I2]"
    timer 90, [1f]
    wait
    [1f]
    timer 0
    #3b,"when characterInput [control_touchef]"
    gosub[case]
    if perso1qx<210 and perso1qy>158 then perso1qx=210
    if perso1zx<258 and perso1zy<172 and perso1zy>160 then perso1zy=172
    if perso1qx<258 and perso1qy<158 and perso1qy>060 then perso1qx=258
    if perso1sx<258 and perso1sy<070 and perso1sy>060 then perso1sy=060
    if perso1qx<240 and perso1qy<072 then perso1qx=240
    if perso1dx>348 and perso1dx<360 and perso1dy<120 then perso1dx=348
    if perso1zx>348 and perso1zx<420 and perso1zy<120 then perso1zy=120
    if perso1dx>390 and perso1dx<400 and perso1dy<162 then perso1dx=390
    if perso1zx>390 and perso1zx<462 and perso1zy<162 then perso1zy=162
    if perso1qx>450 and perso1qx<462 and perso1qy<162 then perso1qx=462
    if perso1zx>450 and perso1zx<498 and perso1zy<108 then perso1zy=108
    if perso1qx>490 and perso1qx<498 and perso1qy<108 then perso1qx=498
    if perso1zx>490 and perso1zx<672 and perso1zy<066 then perso1zy=066
    if perso1qx>660 and perso1qx<672 and perso1qy<066 then perso1qx=672
    if perso1zx>600 and perso1zx<990 and perso1zy<030 then perso1zy=030
    if perso1dx>450 and perso1dx<460 and perso1dy>282 then perso1dx=450
    if perso1sx>450 and perso1sy<300 and perso1sy>282 then perso1sy=282
    if perso1dx>524 and perso1dx<540 and perso1dy>210 then perso1dx=524
    if perso1sx>524 and perso1sy>210 and perso1sy<230 then perso1sy=210
    if perso1dx>570 and perso1dx<580 and perso1dy>168 then perso1dx=570
    if perso1sx>524 and perso1sy>210 and perso1sy<230 then perso1sy=210
    if perso1dx>570 and perso1dx<580 and perso1dy>168 then perso1dx=570
    if perso1sx>570 and perso1sy>168 and perso1sy<180 then perso1sy=168
    if perso1dx>642 and perso1dx<650 and perso1dy>132 then perso1dx=642
    if perso1sx>642 and perso1sy>132 then perso1sy=132
    if perso1sx <360 and perso1sy<18 then [map7bis]
    if perso1sx >950 then [map9bis]
    if perso1sx >50 and perso1sy>380 then [map5]
    wait



'carte 7 ---------------------------------------------------------------

    [map7bis]
    map6=1:map7=0:openW = 1
    [map7]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next
    unloadbmp "JB"

    [jeuhumain7]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=510:map=7

    loadbmp"JB", "bmp\map\maphum7.bmp"
    sprites$ = "minimap2 minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 voleur"
    for s = 1 to 17
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map7=0 and load = 0 then gosub[map7a]
    if map7=1 and load = 0 then gosub[map7b]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_toucheg]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map7a]
    perso1zx=330:perso1zy=372
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map7b]
    perso1sx=420:perso1sy=030
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_toucheg]
    #3b,"when characterInput [I2]"
    timer 90, [1g]
    wait
    [1g]
    timer 0
    #3b,"when characterInput [control_toucheg]"
    gosub[case]

    if perso1sx <900 and perso1sy<18 then [map8bis]
    if perso1sx >50 and perso1sy>390 then [map6]
    if perso1dx>456 and perso1dx<470 and perso1dy>228 then perso1dx=456
    if perso1sx>456 and perso1sx<574 and perso1sy>228 then perso1sy=228
    if perso1qx<574 and perso1qx>550 and perso1qy>228 then perso1qx=574
    if perso1sx>560 and perso1sy>300 then perso1sy=300
    if perso1dx>678 and perso1dy>264 then perso1dx=678
    if perso1sx>678 and perso1sy>264 then perso1sy=264
    if perso1dx>714 and perso1dy>010 then perso1dx=714
    if perso1zx>540 and perso1zy<138 then perso1zy=138
    if perso1dx>540 and perso1dy<138 then perso1dx=540
    if perso1zx>510 and perso1zy<060 then perso1zy=060
    if perso1dx>510 and perso1dy<060 then perso1dx=510
    if perso1qx<120 and perso1qy>100 then perso1qx=120
    if perso1zx<312 and perso1zy<240 and perso1zy>180 then perso1zy=240
    if perso1qx<312 and perso1qy>144 and perso1qy<240 then perso1qx=312
    if perso1sx<312 and perso1sy>144 and perso1sy<174 then perso1sy=144
    if perso1qx<276 and perso1qy<150 then perso1qx=276
    if perso1zx<360 and perso1zy<060 then perso1zy=060
    if perso1qx<360 and perso1qy<060 then perso1qx=360
    wait


'carte 8 ---------------------------------------------------------------

    [map8bis]
    map7=1:map8=0:openW = 1
    [map8]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next
    unloadbmp "JB"

    [jeuhumain8]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=476:map=8

    loadbmp"JB", "bmp\map\maphum8.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map8=0 and load = 0 then gosub[map8a]
    if map8=1 and load = 0 then gosub[map8b]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1z ";perso1zx;" ";perso1zy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1q off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_toucheh]"
    openW = 1
    #3b,"drawsprites"
    wait

    [map8a]
    perso1zx=228:perso1zy=372
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map8b]
    perso1sx=650:perso1sy=130
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return


    [control_toucheh]
    #3b,"when characterInput [I2]"
    timer 90, [1h]
    wait
    [1h]
    timer 0
    #3b,"when characterInput [control_toucheh]"
    gosub[case]

    if perso1sx <500 and perso1sy>390 then [map7]
    if perso1dx>312 and perso1dx<350 and perso1dy>276 then perso1dx=312
    if perso1sx>312 and perso1sx<372 and perso1sy>276 then perso1sy=276
    if perso1dx>336 and perso1dx<380 and perso1dy>246 then perso1dx=336
    if perso1sx>336 and perso1sx<672 and perso1sy>246 then perso1sy=246
    if perso1dx>402 and perso1dx<462 and perso1dy>204 then perso1dx=402
    if perso1sx>402 and perso1sx<594 and perso1sy>204 then perso1sy=204
    if perso1qx<594 and perso1qx>562 and perso1qy>204 then perso1qx=594
    if perso1qx<672 and perso1qx>562 and perso1qy>246 then perso1qx=672
    if perso1sx>642 and perso1sy>300 then perso1sy=300
    if perso1dx>750 and perso1dy>010 then perso1dx=750
    if perso1zx>672 and perso1zy<210 then perso1zy=210
    if perso1dx>672 and perso1dy<210 then perso1dx=672
    if perso1zx>010 and perso1zy<126 then perso1zy=126
    if perso1qx<252 and perso1qy<168 then perso1qx=252
    if perso1zx<252 and perso1zy<168 then perso1zy=168
    if perso1qx<222 and perso1qy<258 then perso1qx=222
    if perso1zx<222 and perso1zy<258 then perso1zy=258
    if perso1qx<168 and perso1qy>010 then perso1qx=168
    wait


'carte 9 ---------------------------------------------------------------

    [map9bis]
    map6=2:map8=1:map9=0:openW = 1
    [map9]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain9]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=83:curseury=533:map=9

    loadbmp"JB", "bmp\map\maphum9.bmp"
    sprites$ = "minimap2 minimap1 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1 voleur"
    for s = 1 to 17
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map9=0 and load = 0 then gosub[map9a]
    if map9=1 and load = 0 then gosub[map9b]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchei]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map9a]
    perso1dx=30:perso1dy=150
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return
    [map9b]
    perso1qx=930:perso1qy=330
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return

    [control_touchei]
    #3b,"when characterInput [I2]"
    timer 90, [1i]
    wait
    [1i]
    timer 0
    #3b,"when characterInput [control_touchei]"
    gosub[case]

    if perso1sx>0 and perso1sy>390 then perso1sy=390
    if perso1qx>950 then [map10bis]
    if perso1qx<18 then [map6]
    if perso1zx>001 and perso1zx<270 and perso1zy<102 then perso1zy=102
    if perso1dx>198 and perso1dx<240 and perso1dy<156 then perso1dx=198
    if perso1zx>198 and perso1zx<264 and perso1zy<156 then perso1zy=156
    if perso1qx>250 and perso1qx<264 and perso1qy<156 then perso1qx=264
    if perso1zx>260 and perso1zx<420 and perso1zy<120 then perso1zy=120
    if perso1qx<420 and perso1qx>380 and perso1qy<120 then perso1qx=420
    if perso1zx>380 and perso1zx<540 and perso1zy<066 then perso1zy=066
    if perso1dx>492 and perso1dx<540 and perso1dy<144 then perso1dx=492
    if perso1sx>450 and perso1sy<150 and perso1sy>138 then perso1sy=138
    if perso1dx>450 and perso1dy>138 and perso1dy<282 then perso1dx=450
    if perso1zx>450 and perso1zy>270 and perso1zy<282 then perso1zy=282
    if perso1dx>654 and perso1dx<720 and perso1dy<312 then perso1dx=654
    if perso1zx>654 and perso1zx<738 and perso1zy<312 then perso1zy=312
    if perso1qx<738 and perso1qx>720 and perso1qy<312 then perso1qx=738
    if perso1sx<090 and perso1sy>222 and perso1sy<230 then perso1sy=222
    if perso1qx<090 and perso1qy>222 then perso1qx=090
    if perso1sx<300 and perso1sy>270 and perso1sy<310 then perso1sy=270
    if perso1qx<300 and perso1qy>270 then perso1qx=300
    if perso1sx<348 and perso1sy>330 and perso1sy<360 then perso1sy=330
    if perso1qx<348 and perso1qy>330 then perso1qx=348
    if perso1sx>010 and perso1sy>390 then perso1sy=390
    if perso1dx>474 and perso1dx<500 and perso1dy>366 then perso1dx=474
    if perso1sx>474 and perso1sx<546 and perso1sy>366 then perso1sy=366
    if perso1qx<546 and perso1qy>366 then perso1qx=546
    if perso1dx>828 and perso1dy>360 then perso1dx=828
    if perso1sx>828 and perso1sy>360 then perso1sy=360
    wait

'carte 10 ---------------------------------------------------------------

    [map10bis]
    map9=1:map10=0:openW = 1
    [map10]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain10]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=120:curseury=533:map=10

    loadbmp"JB", "bmp\map\maphum10.bmp"
    sprites$ = "minimap2 minimap3 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 16
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map10=0 and load = 0 then gosub[map10a]
    if map10=1 and load = 0 then gosub[map10b]
    if map10=2 and load = 0 then gosub[map10c]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    #3b,"SpriteVisible minimap2 on"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchej]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map10a]
    perso1dx=30:perso1dy=360
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return
    [map10b]
    perso1sx=300:perso1sy=150
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map10c]
    perso1qx=960:perso1qy=240
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return

    [control_touchej]
    #3b,"when characterInput [I2]"
    timer 90, [1j]
    wait
    [1j]
    timer 0
    #3b,"when characterInput [control_touchej]"
    gosub[case]

    if perso1sx>0 and perso1sy>390 then perso1sy=390
    if perso1dx>970 and perso1dy > 200 then [map17bis]
    if perso1qx<18 then [map9]
    if perso1zx>270 and perso1zx<350 and perso1zy<120 then [map11bis]
    if perso1sx>001 and perso1sx<258 and perso1sy>390 then perso1sy=390
    if perso1qx<258 and perso1qy>390 then perso1qx=258
    if perso1sx>001 and perso1sy>414 then perso1sy=414
    if perso1dx>492 and perso1dy>294 and perso1dx<500 then perso1dx=492
    if perso1sx>492 and perso1sx<912 and perso1sy>294 then perso1sy=294
    if perso1dx>546 and perso1dy>270 and perso1dx<590 then perso1dx=546
    if perso1sx>546 and perso1sx<620 and perso1sy>270 then perso1sy=270
    if perso1dx>600 and perso1dy>156 and perso1dx<620 then perso1dx=600
    if perso1sx>600 and perso1sx<846 and perso1sy>156 then perso1sy=156
    if perso1dx>710 and perso1dy>132 and perso1dx<740 then perso1dx=710
    if perso1sx>710 and perso1sx<782 and perso1sy>132 then perso1sy=132
    if perso1qx>762 and perso1qy>132 and perso1qx<782 then perso1qx=782
    if perso1qx>820 and perso1qy>156 and perso1qx<846 then perso1qx=846
    if perso1qx>900 and perso1qy>294 and perso1qx<912 then perso1qx=912
    if perso1sx>900 and perso1sy>330 then perso1sy=330
    if perso1zx>001 and perso1zx<306 and perso1zy<342 and perso1zy>322 then perso1zy=342
    if perso1qx>290 and perso1qy>210 and perso1qx<306 then perso1qx=306
    if perso1sx>100 and perso1sx<306 and perso1sy>210 and perso1sy<230 then perso1sy=210
    if perso1qx>240 and perso1qy<230 and perso1qx<288 then perso1qx=288
    if perso1zx>001 and perso1zx<516 and perso1zy<132 then perso1zy=132
    if perso1qx>500 and perso1qy<132 and perso1qx<516 then perso1qx=516
    if perso1zx>001 and perso1zx<668 and perso1zy<102 then perso1zy=102
    if perso1qx>650 and perso1qy<102 and perso1qx<668 then perso1qx=668
    if perso1zx>001 and perso1zy<048 then perso1zy=048
    wait

'carte 11 ---------------------------------------------------------------

    [map11bis]
    map10=1:map11=0:openW = 1
    [map11]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain11]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=118:curseury=510:map=11

    loadbmp"JB", "bmp\map\maphum11.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map11=0 and load = 0 then gosub[map11a]
    if map11=1 and load = 0 then gosub[map11b]
    if map11=2 and load = 0 then gosub[map11c]
    if map11=3 and load = 0 then gosub[map11d]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchek]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map11a]
    perso1zx=390:perso1zy=360
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map11b]
    perso1sx=450:perso1sy=030
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map11c]
    perso1qx=630:perso1qy=42
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return
    [map11d]
    perso1dx=270:perso1dy=042
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return

    [control_touchek]
    #3b,"when characterInput [I2]"
    timer 90, [1k]
    wait
    [1k]
    timer 0
    #3b,"when characterInput [control_touchek]"
    gosub[case]

    if perso1sx>0 and perso1sy>380 then [map10]
    if perso1zx>0 and perso1zy<30 then [map12bis]
    if perso1dx>650 and perso1dy<200 then [map13bis]
    if perso1qx<270 and perso1qy<200 then [map15bis]
    if perso1sx>0 and perso1sy>390 then perso1sy=390
    if perso1dx>450 and perso1dx<520 and perso1dy>294 then perso1dx=450
    if perso1sx>450 and perso1sx<510 and perso1sy>294 then perso1sy=294
    if perso1dx>492 and perso1dx<520 and perso1dy>060 then perso1dx=492
    if perso1sx>492 and perso1sy>060 then perso1sy=060
    if perso1qx<318 and perso1qx>280 and perso1qy<360 then perso1qx=318
    if perso1sx>312 and perso1sx<378 and perso1sy>150 and perso1sy<170 then perso1sy=150
    if perso1qx<378 and perso1qx>360 and perso1qy<258 and perso1qy>150 then perso1qx=378
    if perso1zx>312 and perso1zx<378 and perso1zy<258 and perso1zy>170 then perso1zy=258
    if perso1qx<342 and perso1qx>330 and perso1qy<300 and perso1qy>238 then perso1qx=342
    if perso1zx>300 and perso1zx<342 and perso1zy<300 and perso1zy>270 then perso1zy=300
    if perso1zx>240 and perso1zx<318 and perso1zy<360 and perso1zy>300 then perso1zy=360
    if perso1qx<288 and perso1qy<420 then perso1qx=288
    wait


'carte 12 ---------------------------------------------------------------

    [map12bis]
    map11=1:map12=0:openW = 1
    [map12]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain12]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=122:curseury=485:map=12

    loadbmp"JB", "bmp\map\maphum12.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map12=0 and load = 0 then gosub[map12a]
    if map12=1 and load = 0 then gosub[map12b]
    if map12=2 and load = 0 then gosub[map12c]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchel]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map12a]
    perso1zx=450:perso1zy=378
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map12b]
    perso1dx=30:perso1dy=060
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return
    [map12c]
    perso1sx=150:perso1sy=060
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_touchel]
    #3b,"when characterInput [I2]"
    timer 90, [1l]
    wait
    [1l]
    timer 0
    #3b,"when characterInput [control_touchel]"
    gosub[case]

    if perso1sx>0 and perso1sy>380 then [map11]
    if perso1sx>0 and perso1sy>390 then perso1sy=390
    if perso1qx<300 and perso1qy<500 then perso1qx=300
    if perso1zx<330 and perso1zy<372 then perso1zy=372
    if perso1qx<330 and perso1qy<372 then perso1qx=330
    if perso1zx>300 and perso1zx<600 and perso1zy<300 then perso1zy=300
    if perso1dx>438 and perso1dy<342 then perso1dx=438
    if perso1zx>438 and perso1zy<342 then perso1zy=342
    if perso1dx>612 and perso1dy>200 then perso1dx=612
    'limites
    wait


'carte 13 ---------------------------------------------------------------

    [map13bis]
    map11=2:map12=1:map13=0:openW = 1
    [map13]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain13]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=143:curseury=502:map=13

    loadbmp"JB", "bmp\map\maphum13.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map13=0 and load = 0 then gosub[map13a]
    if map13=1 and load = 0 then gosub[map13b]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchem]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map13a]
    perso1dx=210:perso1dy=090
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return
    [map13b]
    perso1sx=perso1sx:perso1sy=036
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_touchem]
    #3b,"when characterInput [I2]"
    timer 90, [1m]
    wait
    [1m]
    timer 0
    #3b,"when characterInput [control_touchem]"
    gosub[case]
    if perso1zx<192 and perso1zy<66 then perso1zy=66
    if perso1qx<192 and perso1qy<66 then perso1qx=192
    if perso1qx<156 and perso1qy<400 then perso1qx=156
    if perso1sx<254 and perso1sy>254 then perso1sy=254
    if perso1qx<254 and perso1qy>254 then perso1qx=254
    if perso1sx>10 and perso1sy>414 then perso1sy=414
    if perso1dx>504 and perso1dy>272 then perso1dx=504
    if perso1sx>504 and perso1sy>272 then perso1sy=272
    if perso1dx>702 and perso1dy<400 then perso1dx=702
    if perso1qx<162 and perso1qy>72 and perso1qy<132 then [map11]
    if perso1qx>192 and perso1sy<30 then [map14bis]
    wait

'carte 14 ---------------------------------------------------------------

    [map14bis]
    map15=2:map13=1:map14=0:openW = 1
    [map14]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain14]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    map15=2:system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=145:curseury=487:map=14

    loadbmp"JB", "bmp\map\maphum14.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map14=0 and load = 0 then gosub[map14a]
    if map14=1 and load = 0 then gosub[map14b]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchen]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map14a]
    perso1zx=perso1zx:perso1zy=378
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map14b]
    perso1dx=36:perso1dy=150
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return

    [control_touchen]
    #3b,"when characterInput [I2]"
    timer 90, [1n]
    wait
    [1n]
    timer 0
    #3b,"when characterInput [control_touchen]"
    gosub[case]

    if perso1sx<120 and perso1sy>220 then perso1sy=220
    if perso1qx<120 and perso1qy>220 then perso1qx=120
    if perso1dx>720 then perso1dx=720
    if perso1sy>390 then perso1sy=390
    if perso1zy<114 then perso1zy=114
    if perso1sx>90 and perso1sy>384 then [map13]
    if perso1qx<30 and perso1qy<220 then [map15]
    'limites
    wait

'carte 15 ---------------------------------------------------------------

    [map15bis]
    map11=3:map14=1:map15=0:openW = 1
    [map15]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain15]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    map11=3:map14=1:system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=108:curseury=483:map=15

    loadbmp"JB", "bmp\map\maphum15.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map15=0 and load = 0 then gosub[map15a]
    if map15=1 and load = 0 then gosub[map15b]
    if map15=2 and load = 0 then gosub[map15c]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_toucheo]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map15a]
    perso1qx=690:perso1qy=390
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return
    [map15b]
    perso1zx=400:perso1zy=384
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map15c]
    perso1sx=900:perso1sy=060
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_toucheo]
    #3b,"when characterInput [I2]"
    timer 90, [1o]
    wait
    [1o]
    timer 0
    #3b,"when characterInput [control_toucheo]"
    gosub[case]

    if perso1sx>0 and perso1sy>396 then perso1sy=396
    if perso1sy>390 then perso1sy=390
    if perso1qx<258 then perso1qx=258
    if perso1dx>648 then perso1dx=648
    if perso1zy<48 then perso1zy=48
    if perso1dx>700 and perso1dy>360 then [map11]
    if perso1sx>200 and perso1sx<650 and perso1sy>390 then [map16bis]
    if perso1dx>910 and perso1dy<200 then [map14]
    'limites
    wait

'carte 16 ---------------------------------------------------------------

    [map16bis]
    map15=1:map16=0:openW = 1
    [map16]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain16]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=106:curseury=510:map=16

    loadbmp"JB", "bmp\map\maphum16.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map16=0 and load = 0 then gosub[map16a]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"addsprite curseur curseur"
    #3b,"spritexy curseur ";curseurx;" ";curseury
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchep]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map16a]
    perso1sx=400:perso1sy=036
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_touchep]
    #3b,"when characterInput [I2]"
    timer 90, [1p]
    wait
    [1p]
    timer 0
    #3b,"when characterInput [control_touchep]"
    gosub[case]

    if perso1sy>414 then perso1sy=414
    if perso1qx<282 then perso1qx=282
    if perso1dx>642 then perso1dx=642
    if perso1zy<12 then perso1zy=12
    if perso1sx>0 and perso1sy<30 then [map15]
    'limites
    wait

'carte 17 ---------------------------------------------------------------

    [map17bis]
    map10=2:map16=1:map17=0:openW = 1
    [map17]
    load=0
    sprites$ = "minimap2 minimap3 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 16
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain17]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    map10=2:system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap3x=16:minimap3y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=466:map=17

    loadbmp"JB", "bmp\map\maphum17.bmp"
    sprites$ = "minimap2 minimap3 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 16
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map17=0 and load = 0 then gosub[map17a]
    if map17=1 and load = 0 then gosub[map17b]
    gosub[mapreg1]
    #3b,"addsprite minimap3 minimap3"
    #3b,"spritexy minimap3 ";minimap3x;" ";minimap3y
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    #3b,"SpriteVisible minimap2 off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_toucheq]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map17a]
    perso1dx=36:perso1dy=232
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return
    [map17b]
    perso1zx=450:perso1zy=372
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_toucheq]
    #3b,"when characterInput [I2]"
    timer 90, [1q]
    wait
    [1q]
    timer 0
    #3b,"when characterInput [control_toucheq]"
    gosub[case]

    if perso1sx>0 and perso1sy>396 then perso1sy=396
    if perso1qx<30 and perso1qy>150 then [map10]
    if perso1sx>30 and perso1sy>390 then [map18bis]
    if perso1sy >390 then perso1sy = 390
    if perso1dx >900 then perso1dx = 900
    if perso1qx <9 then perso1qx = 9
    if perso1zy <9 then perso1zy = 9
    'limites
    wait


'carte 18 ---------------------------------------------------------------

    [map18bis]
    map17=1:map18=0:openW = 1
    [map18]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain18]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=466:map=18

    loadbmp"JB", "bmp\map\maphum18.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map18=0 and load = 0 then gosub[map18a]
    if map18=1 and load = 0 then gosub[map18b]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_toucher]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map18a]
    perso1sx=450:perso1sy=36
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map18b]
    perso1zx=450:perso1zy=372
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_toucher]
    #3b,"when characterInput [I2]"
    timer 90, [1r]
    wait
    [1r]
    timer 0
    #3b,"when characterInput [control_toucher]"
    gosub[case]

    if perso1sx>0 and perso1sy>396 then perso1sy=396
    if perso1zx>0 and perso1zy<30 then [map17]
    if perso1sx>0 and perso1sy>390 then [map19bis]
    if perso1sy >390 then perso1sy = 390
    if perso1dx >900 then perso1dx = 900
    if perso1qx <9 then perso1qx = 9
    if perso1zy <9 then perso1zy = 9
    'limites
    wait


'carte 19 ---------------------------------------------------------------

    [map19bis]
    map18=1:map19=0:map20=0:openW = 1
    [map19]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain19]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=466:map=19

    loadbmp"JB", "bmp\map\maphum19.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map19=0 and load = 0 then gosub[map19a]
    if map19=1 and load = 0 then gosub[map19b]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touches]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map19a]
    perso1sx=450:perso1sy=36
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map19b]
    perso1zx=450:perso1zy=372
    perso1sx=perso1zx:perso1sy=perso1zy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return

    [control_touches]
    #3b,"when characterInput [I2]"
    timer 90, [1s]
    wait
    [1s]
    timer 0
    #3b,"when characterInput [control_touches]"
    gosub[case]

    if perso1sx>0 and perso1sy>396 then perso1sy=396
    if perso1zx>0 and perso1zy>390 then [map20bis]
    if perso1zx>0 and perso1zy<30 then [map18]
    if perso1sy >390 then perso1sy = 390
    if perso1dx >900 then perso1dx = 900
    if perso1qx <9 then perso1qx = 9
    if perso1zy <9 then perso1zy = 9
    'limites
    wait

'carte 20 ---------------------------------------------------------------

    [map20bis]
    map19=1:map20=0:openW = 1
    [map20]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain20]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=466:map=20

    loadbmp"JB", "bmp\map\maphum20.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map20=0 and load = 0 then gosub[map20a]
    if map20=1 and load = 0 then gosub[map20b]
    if map20=2 and load = 0 then gosub[map20c]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchet]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map20a]
    perso1sx=450:perso1sy=36
    perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1sx:perso1qy=perso1sy:perso1dx=perso1sx:perso1dy=perso1sy
    return
    [map20b]
    perso1dx=36:perso1dy=300
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return
    [map20c]
    perso1qx=800:perso1qy=300
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return

    [control_touchet]
    #3b,"when characterInput [I2]"
    timer 90, [1t]
    wait
    [1t]
    timer 0
    #3b,"when characterInput [control_touchet]"
    gosub[case]

    if perso1sx>0 and perso1sy>390 then perso1sy=390
    if perso1zx>0 and perso1zy<30 then [map19]
    if perso1zx>850 and perso1zy>200 then [map21bis]
    if perso1zx<30 and perso1zy>200 then [map22bis]
    if perso1sy >390 then perso1sy = 390
    if perso1dx >900 then perso1dx = 900
    if perso1qx <9 then perso1qx = 9
    if perso1zy <9 then perso1zy = 9
    'limites
    wait

'carte 21 ---------------------------------------------------------------

    [map21bis]
    map20=2:map21=0:openW = 1
    [map21]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain21]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=466:map=21

    loadbmp"JB", "bmp\map\maphum21.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map21=0 and load = 0 then gosub[map21a]

    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_toucheu]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map21a]
    perso1dx=36:perso1dy=384
    perso1sx=perso1dx:perso1sy=perso1dy:perso1zx=perso1sx:perso1zy=perso1sy:perso1qx=perso1dx:perso1qy=perso1dy
    return

    [control_toucheu]
    #3b,"when characterInput [I2]"
    timer 90, [1u]
    wait
    [1u]
    timer 0
    #3b,"when characterInput [control_toucheu]"
    gosub[case]

    if perso1sx>0 and perso1sy>390 then perso1sy=390
    if perso1zx<30 and perso1zy>30 then [map20]
    'limites
    wait

'carte 22 ---------------------------------------------------------------

    [map22bis]
    map20=1:map22=0:openW = 1
    [map22]
    load=0
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        unloadbmp word$(sprites$,s)
    next

    unloadbmp "JB"

    [jeuhumain22]
    gosub[closeSecur]
    WindowWidth=1020:WindowHeight = 600 : game$ = "on"
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    system=1:agrandmap=1:sortbook=1:inventaire=1:menugame=1:minimap2x=16:minimap2y=447:hb1x=-6:hb1y=422:curseurx=47:curseury=466:map=22

    loadbmp"JB", "bmp\map\maphum22.bmp"
    sprites$ = "minimap2 perso1d perso2d perso4d perso1s perso2s perso4s perso1q perso2q "+_
               "perso4q perso1z perso2z perso4z curseur hb1"
    for s = 1 to 15
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

    gosub[button]
    if openW = 0 then
        if version = 1 then
            open "Eternal Quest : les runes de l'apocalypse" for graphics_nsb_nf as #3b
        end if
        if version = 2 then
            open "Eternal Quest : runes of the Apocalypse" for graphics_nsb_nf as #3b
        end if
        openW = 1
    end if

    if map22=0 and load = 0 then gosub[map22a]
    gosub[mapreg1]
    #3b,"addsprite minimap2 minimap2"
    #3b,"spritexy minimap2 ";minimap2x;" ";minimap2y
    #3b,"spritexy perso1q ";perso1qx;" ";perso1qy
    #3b,"SpriteVisible perso1d off"
    #3b,"SpriteVisible perso1z off"
    #3b,"SpriteVisible perso1s off"
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    #3b,"when characterInput [control_touchev]"
    #3b,"drawsprites"
    openW = 1
    wait

    [map22a]
    perso1qx=950:perso1qy=282
    perso1sx=perso1qx:perso1sy=perso1qy:perso1dx=perso1sx:perso1dy=perso1sy:perso1zx=perso1sx:perso1zy=perso1sy
    return


    [control_touchev]
    #3b,"when characterInput [I2]"
    timer 90, [1v]
    wait
    [1v]
    timer 0
    #3b,"when characterInput [control_touchev]"
    gosub[case]

    if perso1sx>0 and perso1sy>390 then perso1sy=390
    if perso1dx>980 and perso1dy>30 then [map20]
    if perso1sy >390 then perso1sy = 390
    if perso1dx >900 then perso1dx = 900
    if perso1qx <9 then perso1qx = 9
    if perso1zy <9 then perso1zy = 9
    'limites
    wait

'-----déplacement-------------------------------------------------------------------------------------------------------------------|

            [persod]
            #3b,"SpriteVisible perso1s off"
            #3b,"SpriteVisible perso1q off"
            #3b,"SpriteVisible perso1z off"
            #3b,"SpriteVisible perso1d on"
            perso1qx=perso1dx : perso1sx=perso1dx : perso1zx=perso1dx
            perso1dx=perso1dx+6
            #3b,"spritexy perso1d ";perso1dx;" ";perso1dy
            #3b,"cyclesprite perso1d 1"
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

'-----sous-fenetres-------------------------------------------------------------------------------------------------------------------|

            [menu]
            if menugame=1 then [menu2]
            if menugame=2 then
                close #3
            end if
            [menu2]
            menugame=2
            WindowWidth = 195 : WindowHeight = 445
            UpperLeftX=int((DisplayWidth-WindowWidth)/2)
            UpperLeftY=int((DisplayHeight-WindowHeight)/2)

            if version = 1 then
            bmpbutton #3.I2, "bmp\menugameFR.bmp", [I2], UL, 0, 0
            bmpbutton #3, "bmp\aidemenuFR.bmp", [aide], LR, 2, 239
            bmpbutton #3, "bmp\chargermenuFR.bmp", [load], LR, 2, 161
            bmpbutton #3, "bmp\savemenuFR.bmp", [save], LR, 2, 79
            bmpbutton #3, "bmp\quitmenuFR.bmp", [quit], LR, 2, 1
            bmpbutton #3, "bmp\systmenu.bmp", [system], LR, 2, 316
            end if
            if version = 2 then
            bmpbutton #3.I2, "bmp\menugameENG.bmp", [I2], UL, 0, 0
            bmpbutton #3, "bmp\aidemenuENG.bmp", [aide], LR, 2, 239
            bmpbutton #3, "bmp\chargermenuENG.bmp", [load], LR, 2, 161
            bmpbutton #3, "bmp\savemenuENG.bmp", [save], LR, 2, 79
            bmpbutton #3, "bmp\quitmenuENG.bmp", [quit], LR, 2, 1
            bmpbutton #3, "bmp\setting.bmp", [system], LR, 2, 316
            end if

            open "Menu" for window_nf as #3
            print #3.I2, "disable"
            #3,"trapclose [quit3b]"
            wait

            [inventaire]
            close #3b
            inventaire = 2
            win = 2
            Global ncx, ncy, lc
            lc = 20
            WindowWidth=1020:WindowHeight = 600
            UpperLeftX=int((DisplayWidth-WindowWidth)/2)
            UpperLeftY=int((DisplayHeight-WindowHeight)/2)
            loadbmp"JB", "bmp\invent.bmp"
            graphicbox #31.map, 0, 0, 1200, 730

            if version = 1 then
                open "Inventaire" for window_nf as #31
            end if
            if version = 2 then
                open "Inventory" for window_nf as #31
            end if

            #31,"trapclose [reload]"
            #31.map, "down"
            #31.map, "setfocus; when leftButtonDown [SimpleClick2]"
            Gwidth = CenterX * 2 : Gheight = CenterY * 2
            ncx = int(Gwidth/lc)+1 : ncy = int(Gheight/lc)+1
            #31.map, "drawbmp JB 0 0"
            print #31.map, "background JB"
            print #31.map, "font Times New Roman 10; color white"
            print #31.map, "flush"
            if version = 1 then
            NameHeaume$ = NameHeaumeFR$
            NameArmure$ = NameArmureFR$
            NameBras$ = NameBrasFR$
            NameGants$ = NameGantsFR$
            NamePantalon$ = NamePantalonFR$
            NameBottes$ = NameBottesFR$
            NameAnneau1$ = NameAnneau1FR$
            NameAnneau2$ = NameAnneau2FR$
            NameAmu1$ = NameAmu1FR$
            NameAmu2$ = NameAmu2FR$
            print #31.map, "backcolor black ; place 900 40 ;\"; "FERMER"
            print #31.map, "backcolor black ; place 150 44 ;\"; "Heaume :"
            print #31.map, "backcolor black ; place 150 65 ;\"; "Armure :"
            print #31.map, "backcolor black ; place 150 84 ;\"; "Bras :"
            print #31.map, "backcolor black ; place 150 104 ;\"; "Gants :"
            print #31.map, "backcolor black ; place 150 126 ;\"; "Pantalon :"
            print #31.map, "backcolor black ; place 150 147 ;\"; "Bottes :"
            print #31.map, "backcolor black ; place 395 44 ;\"; "Anneau :"
            print #31.map, "backcolor black ; place 395 76 ;\"; "Anneau :"
            print #31.map, "backcolor black ; place 395 107 ;\"; "Amulette :"
            print #31.map, "backcolor black ; place 395 140 ;\"; "Amulette :"
            end if
            if version = 2 then
            NameHeaume$ = NameHeaumeENG$
            NameArmure$ = NameArmureENG$
            NameBras$ = NameBrasENG$
            NameGants$ = NameGantsENG$
            NamePantalon$ = NamePantalonENG$
            NameBottes$ = NameBottesENG$
            NameAnneau1$ = NameAnneau1ENG$
            NameAnneau2$ = NameAnneau2ENG$
            NameAmu1$ = NameAmu1ENG$
            NameAmu2$ = NameAmu2ENG$
            print #31.map, "backcolor black ; place 905 40 ;\"; "CLOSE"
            print #31.map, "backcolor black ; place 150 44 ;\"; "Helmet :"
            print #31.map, "backcolor black ; place 150 65 ;\"; "Armor :"
            print #31.map, "backcolor black ; place 150 84 ;\"; "Arm :"
            print #31.map, "backcolor black ; place 150 104 ;\"; "Gloves :"
            print #31.map, "backcolor black ; place 150 126 ;\"; "Pants :"
            print #31.map, "backcolor black ; place 150 147 ;\"; "Boots :"
            print #31.map, "backcolor black ; place 395 44 ;\"; "Ring :"
            print #31.map, "backcolor black ; place 395 76 ;\"; "Ring :"
            print #31.map, "backcolor black ; place 395 107 ;\"; "Amulet :"
            print #31.map, "backcolor black ; place 395 140 ;\"; "Amulet :"
            end if
            print #31.map, "backcolor black ; place 210 44 ;\"; NameHeaume$
            print #31.map, "backcolor black ; place 210 65 ;\"; NameArmure$
            print #31.map, "backcolor black ; place 210 84 ;\"; NameBras$
            print #31.map, "backcolor black ; place 210 104 ;\"; NameGants$
            print #31.map, "backcolor black ; place 210 126 ;\"; NamePantalon$
            print #31.map, "backcolor black ; place 210 147 ;\"; NameBottes$
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
            print #31.map, "backcolor black ; place 210 44 ;\"; NameHeaume$
            print #31.map, "backcolor black ; place 210 65 ;\"; NameArmure$
            print #31.map, "backcolor black ; place 210 84 ;\"; NameBras$
            print #31.map, "backcolor black ; place 210 104 ;\"; NameGants$
            print #31.map, "backcolor black ; place 210 126 ;\"; NamePantalon$
            print #31.map, "backcolor black ; place 210 147 ;\"; NameBottes$
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


            [sort]
            close #3b
            sortbook=2
            win=2
            Global ncx, ncy, lc
            lc = 20
            WindowWidth=1020:WindowHeight = 600
            UpperLeftX=int((DisplayWidth-WindowWidth)/2)
            UpperLeftY=int((DisplayHeight-WindowHeight)/2)
            loadbmp"JB", "bmp\book.bmp"
            graphicbox #32.map, 0, 0, 1200, 730

            if version = 1 then
                open "Livre des sorts" for window_nf as #32
            end if
            if version = 2 then
                open "Spells book" for window_nf as #32
            end if

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
            print #32.map, "backcolor black ; place 895 45 ;\"; "FERMER"
            print #32.map, "backcolor black ; place 620 84 ;\"; "Caractéristiques :"
            print #32.map, "backcolor black ; place 620 110 ;\"; "Niveau : ";lvlHero
            print #32.map, "backcolor black ; place 620 125 ;\"; "Expérience : ";xp
            print #32.map, "backcolor black ; place 620 140 ;\"; "Argent : ";gold
            print #32.map, "backcolor black ; place 620 155 ;\"; "Attaque : ";atk
            print #32.map, "backcolor black ; place 620 170 ;\"; "Defense : ";def
            print #32.map, "backcolor black ; place 620 185 ;\"; "Points de vie : ";PV;" / ";PVTotal
            print #32.map, "backcolor black ; place 620 200 ;\"; "Points de mana : ";PM;" / ";PMTotal
            print #32.map, "backcolor black ; place 620 215 ;\"; "Déplacement : ";speed
            print #32.map, "backcolor black ; place 620 230 ;\"; "Points d'aptitude disponibles : ";PA
            print #32.map, "backcolor black ; place 620 290 ;\"; "Sorts appris :"
            end if

            if version = 2 then
            print #32.map, "backcolor black ; place 900 45 ;\"; "CLOSE"
            print #32.map, "backcolor black ; place 620 84 ;\"; "Specifications :"
            print #32.map, "backcolor black ; place 620 110 ;\"; "Level : ";lvlHero
            print #32.map, "backcolor black ; place 620 125 ;\"; "Experience : ";xp
            print #32.map, "backcolor black ; place 620 140 ;\"; "Money : ";gold
            print #32.map, "backcolor black ; place 620 155 ;\"; "Attack : ";atk
            print #32.map, "backcolor black ; place 620 170 ;\"; "Defense : ";def
            print #32.map, "backcolor black ; place 620 185 ;\"; "Life points : ";PV;" / ";PVTotal
            print #32.map, "backcolor black ; place 620 200 ;\"; "Points of mana : ";PM;" / ";PMTotal
            print #32.map, "backcolor black ; place 620 215 ;\"; "MoveSpeed : ";speed
            print #32.map, "backcolor black ; place 620 230 ;\"; "Skill points available : ";PA
            print #32.map, "backcolor black ; place 620 290 ;\"; "Spells learned :"
            end if
            wait


            [SimpleClick3]
            mX = MouseX
            mY = MouseY
            if mX>int(44*lc) and mX<int((44*lc)+95) and mY>int(1*lc) and mY<int((1*lc)+25) then
            goto [reload]
            end if
            wait


            [map1grand]
            if agrandmap=1 then [map1grand2]
            if agrandmap=2 then
                close #33
            end if
            [map1grand2]
            agrandmap=2
            WindowWidth = 660:WindowHeight = 600
            UpperLeftX=int((DisplayWidth-WindowWidth)/2)
            UpperLeftY=int((DisplayHeight-WindowHeight)/2)
            if map<=5 then
                bmpbutton #33.I2, "bmp\carteindic1.bmp", [I2], UL, 0, 0
            end if
            if map<=16 and map>5 then
                bmpbutton #33.I2, "bmp\carteindic2.bmp", [I2], UL, 0, 0
            end if
            if map<=22 and map>16 then
                bmpbutton #33.I2, "bmp\carteindic3.bmp", [I2], UL, 0, 0
            end if
            open "" for window_nf as #33
            print #33.I2, "disable"
            #33,"trapclose [quit33]"
            wait

            [I2]
            wait

    [mapreg1]
    #3b,"background JB"
    #3b,"trapclose [quit]"
    #3b,"addsprite hb1 hb1"
    #3b,"addsprite perso1d perso2d perso1d perso4d"
    #3b,"addsprite perso1q perso2q perso1q perso4q"
    #3b,"addsprite perso1s perso2s perso1s perso4s"
    #3b,"addsprite perso1z perso2z perso1z perso4z"
    #3b,"spritexy hb1 ";hb1x;" ";hb1y
    #3b,"setfocus"
    #3b "when leftButtonMove SimpleClick"
    return

    [button]
    bmpbutton #3b, "bmp\menu.bmp", [menu], LR, -15, -18
    bmpbutton #3b, "bmp\livresort.bmp", [sort], LR, 125, -18
    bmpbutton #3b, "bmp\inventaire.bmp", [inventaire], LR, 125, 32
    bmpbutton #3b, "bmp\agrandir.bmp", [map1grand], LR, 768, 73
    return

    [closeSecur]
    if aide = 2 then
        aide=1
        close #3c
    end if
    if menugame = 2 then
        close #3
        menugame = 1
    end if
    if inventaire = 2 then
        close #31
        inventaire = 1
    end if
    if sortbook = 2 then
        close #32
        sortbook = 1
    end if
    if agrandmap = 2 then
        close #33
        agrandmap = 1
    end if
    if system = 2 then
        close #34
        system = 1
    end if
    return

    [case]
    select case
    case asc(right$(Inkey$,1))= _VK_LEFT : gosub [persoq]
    case asc(right$(Inkey$,1))= _VK_DOWN : gosub [persos]
    case asc(right$(Inkey$,1))= _VK_RIGHT : gosub [persod]
    case asc(right$(Inkey$,1))= _VK_UP : gosub [persoz]
    case Inkey$ = "q" or Inkey$ = "Q" : gosub [persoq]
    case Inkey$ = "d" or Inkey$ = "D" : gosub [persod]
    case Inkey$ = "z" or Inkey$ = "Z" : gosub [persoz]
    case Inkey$ = "s" or Inkey$ = "S" : gosub [persos]
    case Inkey$ = "i" or Inkey$ = "I" : gosub [inventaire]
    case Inkey$ = "l" or Inkey$ = "L" : gosub [sort]
    case Inkey$ = "m" or Inkey$ = "M" : gosub [menu]
    case Inkey$ = "c" or Inkey$ = "C" : gosub [savedata]
    end select
    return


    [quit]
    timer 0
    if inventaire = 2 then
        close #31
        inventaire = 1
        scan
        #3b "SetFocus; DrawSprites"
    wait
        wait
    end if

    if aide = 2 then
        aide=1
        close #3c
        playwave "music\hit.wav", async
        timer 100, [quit2]
        wait
    end if

    if game$ = "on" then
        scan
        #3b "SetFocus; DrawSprites"
    end if

    if version = 1 then
    confirm "Voulez-vous quittez le Jeu ?";quit$
    end if
    if version = 2 then
    confirm "Do you want to exit the game?";quit$
    end if
    if quit$ = "no" then [menu]

    if version = 1 then
    confirm "Voulez-vous retournez au menu principal ?";quit$
    end if
    if version = 2 then
    confirm "Would you return to the main menu?";quit$
    end if

    playwave ""
    gosub [closeSecur]
    if quit$ = "yes" then
            close #3b
        goto [iniSONG]
    end if
        close #3b
        saturation = 1
        music = 1
        open "song.dat" for output as #song
        print #song, music
        print #song, saturation
        CLOSE #song
    end

    [quitS]
    timer 0
    gosub [closeSecur]
    if version = 1 then
    confirm "Voulez-vous quittez le Jeu ?";quit$
    end if
    if version = 2 then
    confirm "Do you want to exit the game?";quit$
    end if
    if quit$ = "no" then wait
    playwave ""
    close #3b
    saturation = 1
    music = 1
    open "song.dat" for output as #song
    print #song, music
    print #song, saturation
    CLOSE #song
    end

    [quitSbis]
    timer 0
    gosub [closeSecur]
    if version = 1 then
    confirm "Voulez-vous quittez le Jeu ?";quit$
    end if
    if version = 2 then
    confirm "Do you want to exit the game?";quit$
    end if
    if quit$ = "no" then wait
    playwave ""
    close #2b
    saturation = 1
    music = 1
    open "song.dat" for output as #song
    print #song, music
    print #song, saturation
    CLOSE #song
    end

    [quit33]
    agrandmap=1
    close #33
    scan
    #3b "SetFocus; DrawSprites"
    wait

    [quit2]
    timer 0
    wait

    [quit3b]
    menugame=1
    close #3
        scan
    #3b "SetFocus; DrawSprites"
    wait

    [quit4]
    system=1
    playwave "music\hit.wav", async
    close #34
    timer 100, [quit2]
    wait


'----QuestsOptionnel1----------------------------------------------------------------------------------------------------------------|

[DQop1]
DQop1 = 1
WindowWidth = 400 : WindowHeight = 180
UpperLeftX=int((DisplayWidth-WindowWidth)/3)
UpperLeftY=int((DisplayHeight-WindowHeight)/3)
if version = 1 then
statictext #1.a,"Quête optionelle : La sacoche", 70, 10, 300, 50
statictext #1.b,"''Tiens, un inconnu ? Attendez donc jeune garçon ! Voulez-vous me rendre un service ? Un voleur ! Oui il m'a volé, dépouillé le voyou ! Retrouvez le et ramenez moi ma sacoche.  Je vous attendrez ici avec la récompense... ''", 20, 45, 350, 70
statictext #1.c,"Acceptez-vous ?", 20, 115, 150, 55
button #1, "Oui", [Q1accept], LR, -230, -140,80,25
button #1, "Non", [Q1refuse], LR, -320, -140,80,25
end if
if version = 2 then
statictext #1.a,"Optional Quest : Satchel", 70, 10, 300, 50
statictext #1.b,"''Here, a stranger? Wait a boy! Would you do me a favor? A thief! Yes he stole, stripped the thug! Find him and bring me my bag. I'll wait here with the award ... ''", 20, 45, 350, 70
statictext #1.c,"Do you agree?", 20, 115, 150, 55
button #1, "Yes", [Q1accept], LR, -230, -140,80,25
button #1, "No", [Q1refuse], LR, -320, -140,80,25
end if
open "" for dialog_modal_nf as #1
print #1.a, "!font times_new_roman 16 bold italic"
print #1.b, "!font times_new_roman 10 italic"
print #1.c, "!font times_new_roman 10 bold"
#1,"trapclose [I2]"
wait

[Q1accept]
close #1
Qvoleur = 0
wait
[Q1refuse]
close #1
Qvoleur = 1
wait


[Qop1data]
vieE1 = 80
E1PM = 8
E1atk = 41
E1def = 4
vieE = vieE1
EPM = E1PM
Eatk = E1atk
Edef = E1def
bmpbutton #3c.Indic, "bmp\sceneCombat1.bmp", [w], LR, -20,75
Qopt = 1
return

[Q1voleurfix]
close #1
[Q1voleur]

vieE1 = 60
E1PM = 8
E1atk = 12
E1def = 2

vieE = vieE1
vieETotal = 60
EPM = E1PM
EPMTotal = 8
Eatk = E1atk
Edef = E1def

WindowWidth = 400
WindowHeight = 160
UpperLeftX=int(WindowWidth/2)
UpperLeftY=int(WindowHeight/2)
BackgroundColor$ = "none" : ForegroundColor$ = "none"
if version = 1 then
statictext #1.a,"Quête optionelle : La sacoche", 70, 10, 300, 50
statictext #1.b,"''Tiens, un étranger.... Ce n'est pas avec ce que tu as que je mangerais à ma faim le morveux ! Bouge de là avant que je te fasse goûter à ma lame.''", 20, 45, 350, 50
statictext #1.c,"Voulez-vous attaquez ?", 20, 100, 150, 50
button #1, "Oui", [combat], LR, -200, -120,80,25
button #1, "Non", [confirmQ1], LR, -290, -120,80,25
end if
if version = 2 then
statictext #1.a,"Optional Quest : Satchel", 70, 10, 300, 50
statictext #1.b,"''Here, a stranger .... It is not with what you have that I eat my fill the brat! Move away before I make you taste my blade.''", 20, 45, 350, 50
statictext #1.c,"Would you like to attack him ?", 20, 100, 180, 50
button #1, "Yes", [combat], LR, -220, -120,80,25
button #1, "No", [confirmQ1], LR, -310, -120,80,25
end if
open "" for dialog_modal_nf as #1
print #1.a, "!font times_new_roman 16 bold italic"
print #1.b, "!font times_new_roman 10 italic"
print #1.c, "!font times_new_roman 10 bold"
#1,"trapclose [I2]"
wait

[confirmQ1]
if version = 1 then
confirm "Etes vous sûr de votre choix ?";choix$
end if
if version = 2 then
confirm "Are you sure of your choice?";choix$
end if
if choix$ = "no" then [Q1voleurfix]
Qvoleur = 1
win = 0
close #1
goto [SacocheFix]

'----Combats----------------------------------------------------------------------------------------------------------------|
[w]
wait
[combat]
WindowWidth=1020:WindowHeight=600
UpperLeftX=int((DisplayWidth-WindowWidth)/2)
UpperLeftY=int((DisplayHeight-WindowHeight)/2)

close #1
close #3b
bmpbutton #3c, "bmp\courir.bmp", [run], LR, 11, 444

sprites$ = "beta"
    for s = 1 to 1
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

loadbmp"MAP", "bmp\fondCombat.bmp"
'bmpbutton #3c.Indic, "bmp\beta.bmp", [w], LR, -25,-25
graphicbox #3c.map, 0, 0, 1050, 650
button #3c.attaque, "Attaquer" , [attaque], LR, 915, 70,135,30
open "editeur de combat" for window_nf as #3c
#3c,"trapclose [w]"
#3c.map, "down"
#3c.map, "drawbmp MAP 0 0"
print #3c.map, "background MAP"

betax = 05: betay = 05
#3c.map,"addsprite beta beta"
#3c.map,"spritexy beta ";betax;" ";betay
#3c.map, "spritevisible beta on"
#3c.map,"drawsprites"

print #3c.map, "font Times New Roman 10; color white"
print #3c.map, "flush"
print #3c.map, "backcolor black ; place 800 495 ;\";"P.V";" ";" :"
print #3c.map, "backcolor black ; place 850 495 ;\";" ";PV
print #3c.map, "backcolor black ; place 890 495 ;\";" / "
print #3c.map, "backcolor black ; place 920 495 ;\"; PVTotal;" "

print #3c.map, "backcolor black ; place 800 520 ;\";"P.M";" ";" :"
print #3c.map, "backcolor black ; place 850 520 ;\";" ";PM
print #3c.map, "backcolor black ; place 890 520 ;\";" / "
print #3c.map, "backcolor black ; place 920 520 ;\"; PMTotal;" "

print #3c.map, "backcolor black ; place 60 60 ;\";"P.V";" ";" :"
print #3c.map, "backcolor black ; place 110 60 ;\";" ";vieE
print #3c.map, "backcolor black ; place 150 60 ;\";" / "
print #3c.map, "backcolor black ; place 180 60 ;\"; vieETotal;" "

print #3c.map, "backcolor black ; place 60 85 ;\";"P.M";" ";" :"
print #3c.map, "backcolor black ; place 110 85 ;\";" ";EPM
print #3c.map, "backcolor black ; place 150 85 ;\";" / "
print #3c.map, "backcolor black ; place 180 85 ;\"; EPMTotal;" "
wait


[attaque]
playwave "music\combat.wav", async
#3c.map,"drawsprites"
print #3c.map, "flush"

print #3c.map, "backcolor black ; place 800 495 ;\";"P.V";" ";" :"
print #3c.map, "backcolor black ; place 890 495 ;\";" / "
print #3c.map, "backcolor black ; place 920 495 ;\"; PVTotal;" "

print #3c.map, "backcolor black ; place 800 520 ;\";"P.M";" ";" :"
print #3c.map, "backcolor black ; place 890 520 ;\";" / "
print #3c.map, "backcolor black ; place 920 520 ;\"; PMTotal;" "

print #3c.map, "backcolor black ; place 60 60 ;\";"P.V";" ";" :"
print #3c.map, "backcolor black ; place 150 60 ;\";" / "
print #3c.map, "backcolor black ; place 180 60 ;\"; vieETotal;" "

print #3c.map, "backcolor black ; place 60 85 ;\";"P.M";" ";" :"
print #3c.map, "backcolor black ; place 150 85 ;\";" / "
print #3c.map, "backcolor black ; place 180 85 ;\"; EPMTotal;" "

atkP = int((rnd(atk)*atk+1)- Edef)
contrataque = int((rnd(Eatk)*Eatk+1)-def/2)
if atkP <= 0 then
    print #3c.map, "backcolor black ; place 350 515 ;\";"                                                                                                            "
    print #3c.map, "backcolor black ; place 420 515 ;\";"L'ennemis esquive votre attaque !"
    vieE = vieE
else
    print #3c.map, "backcolor black ; place 350 515 ;\";"                                                                                                            "
    print #3c.map, "backcolor black ; place 420 515 ;\";"Vous infligez ";atkP;" dommages !"
    vieE = vieE - atkP
end if

if contrataque <= 0 then
    print #3c.map, "backcolor black ; place 350 540 ;\";"                                                                                                            "
    print #3c.map, "backcolor black ; place 420 540 ;\";"Vous esquivez l'attaque !"
    PV = PV
else
    print #3c.map, "backcolor black ; place 350 540 ;\";"                                                                                                            "
    print #3c.map, "backcolor black ; place 420 540 ;\";"Vous recevez ";contrataque;" dommages !"
    PV = PV - contrataque
        if PV > healTotal then vie = healTotal
end if

if PV <= 0 then goto [mort]
if vieE <= 0 then goto [win]

print #3c.map, "flush"
print #3c.map, "backcolor black ; place 850 495 ;\";"             "
print #3c.map, "backcolor black ; place 850 495 ;\";" ";PV
print #3c.map, "backcolor black ; place 850 520 ;\";"             "
print #3c.map, "backcolor black ; place 850 520 ;\";" ";PM
print #3c.map, "backcolor black ; place 110 60 ;\";"             "
print #3c.map, "backcolor black ; place 110 60 ;\";" ";vieE
print #3c.map, "backcolor black ; place 110 85 ;\";"             "
print #3c.map, "backcolor black ; place 110 85 ;\";" ";EPM
wait


[defense]
cls
dommage = int((rnd(Eatk)*int(Eatk/2))-def)
print #3c.tbE, " Vous n'attaquez pas..."
if dommage <= 0 then
    playwave "music\defenseOk.wav", async
    print #3c.tbP, " Vous parrez l'attaque !"
else
    playwave "music\defenseNo.wav", async
    print #3c.tbP, " Il vous inflige ";dommage;" dommages !"
    PV = PV - dommage
end if

if PV <= 0 then goto [mort]
print #3c.tbE1, " ";vieE
print #3c.tbE2, " ";EPM
print #3c.tbP1, " ";PV
print #3c.tbP2, " ";PM
wait

[mort]
notice " vous ètes hors combat "
PV = 1
[run]
close #3c
Qvoleur = 1
QvoleurSecur = 0
win = 0
unloadbmp "JB"
goto [reload2]

[win]
notice " vous avez gagnez "
close #3c
Qvoleur = 1
win = 1
QvoleurSecur = 0
unloadbmp "JB"
goto [reload2]


'----sauvegarde-----------------------------------------------------------------------------------------------------------------------|
[save]
close #3

[savedata]
menugame = 1
openW = 0

open "save.ini" for output as #save
print #save, game$
print #save, vieE1
print #save, E1PM
print #save, E1atk
print #save, E1def
print #save, map1
print #save, map2
print #save, map3
print #save, map4
print #save, map5
print #save, map6
print #save, map7
print #save, map8
print #save, map9
print #save, map10
print #save, map11
print #save, map12
print #save, map13
print #save, map14
print #save, map15
print #save, map16
print #save, map17
print #save, map18
print #save, map19
print #save, map20
print #save, map21
print #save, map22
print #save, map23
print #save, openW
print #save, music
print #save, menugame
print #save, inventaire
print #save, sortbook
print #save, secteur
print #save, campagne
print #save, map
print #save, lvlHero
print #save, PV
print #save, PVTotal
print #save, PM
print #save, PMTotal
print #save, atk
print #save, def
print #save, PVLvL
print #save, PMLvL
print #save, atkLvL
print #save, defLvL
print #save, speed
print #save, gold
print #save, xp
print #save, XpLvL
print #save, perso1sx
print #save, perso1sy
print #save, perso1dx
print #save, perso1dy
print #save, perso1zx
print #save, perso1zy
print #save, perso1qx
print #save, perso1qy
print #save, PA
print #save, Qvoleur
print #save, DQop1
print #save, gameD
print #save, NameHeaumeFR$
print #save, NameArmureFR$
print #save, NameBrasFR$
print #save, NameGantsFR$
print #save, NamePantalonFR$
print #save, NameBottesFR$
print #save, NameAnneau1FR$
print #save, NameAnneau2FR$
print #save, NameAmu1FR$
print #save, NameAmu2FR$
print #save, NameHeaumeENG$
print #save, NameArmureENG$
print #save, NameBrasENG$
print #save, NameGantsENG$
print #save, NamePantalonENG$
print #save, NameBottesENG$
print #save, NameAnneau1ENG$
print #save, NameAnneau2ENG$
print #save, NameAmu1ENG$
print #save, NameAmu2ENG$
CLOSE #save

if version = 1 then
notice "Partie sauvegardé !"
end if
if version = 2 then
notice "Game saved !"
end if
#3b "SetFocus; DrawSprites"
wait

'----chargement----------------------------------------------------------------------------------------------------------------|
[load]
if version = 1 then
confirm "Charger votre dernière partie ?"; load$
end if
if version = 2 then
confirm "Load your last game?"; load$
end if

if load$ = "no" then wait
load = 1
dir$ = "" : file$ = "save.ini"
if fileExist(dir$,file$) = 0 then
    if version = 1 then
    notice "Vous n'avez aucune sauvegarde d'enregistré !"
    end if
    if version = 2 then
    notice "You have no backup save!"
    end if
    wait
end if

[loading1]
load = 1 : win = 2
if menugame = 2 then close #3
menugame = 1
if game$ = "off" then
    close #2b
end if
if game$ = "on" then
    close #3b
end if
open "save.ini" for input as #save
goto [dataload]

[dataload]
input #save, game$
input #save, vieE1
input #save, E1PM
input #save, E1atk
input #save, E1def
input #save, map1
input #save, map2
input #save, map3
input #save, map4
input #save, map5
input #save, map6
input #save, map7
input #save, map8
input #save, map9
input #save, map10
input #save, map11
input #save, map12
input #save, map13
input #save, map14
input #save, map15
input #save, map16
input #save, map17
input #save, map18
input #save, map19
input #save, map20
input #save, map21
input #save, map22
input #save, map23
input #save, openW
input #save, music
input #save, menugame
input #save, inventaire
input #save, sortbook
input #save, secteur
input #save, campagne
input #save, map
input #save, lvlHero
input #save, PV
input #save, PVTotal
input #save, PM
input #save, PMTotal
input #save, atk
input #save, def
input #save, PVLvL
input #save, PMLvL
input #save, atkLvl
input #save, defLvl
input #save, speed
input #save, gold
input #save, xp
input #save, XpLvL
input #save, perso1sx
input #save, perso1sy
input #save, perso1dx
input #save, perso1dy
input #save, perso1zx
input #save, perso1zy
input #save, perso1qx
input #save, perso1qy
input #save, PA
input #save, Qvoleur
input #save, DQop1
input #save, gameD
input #save, NameHeaumeFR$
input #save, NameArmureFR$
input #save, NameBrasFR$
input #save, NameGantsFR$
input #save, NamePantalonFR$
input #save, NameBottesFR$
input #save, NameAnneau1FR$
input #save, NameAnneau2FR$
input #save, NameAmu1FR$
input #save, NameAmu2FR$
input #save, NameHeaumeENG$
input #save, NameArmureENG$
input #save, NameBrasENG$
input #save, NameGantsENG$
input #save, NamePantalonENG$
input #save, NameBottesENG$
input #save, NameAnneau1ENG$
input #save, NameAnneau2ENG$
input #save, NameAmu1ENG$
input #save, NameAmu2ENG$
CLOSE #save

if menugame > 1 then menugame = 1
if inventaire > 1 then inventaire = 1
if sortbook > 1 then sortbook = 1

if music = 0 then counter = 1
if music = 1 then counter = 0

        saturation = 1
        music = 1
        open "song.dat" for output as #song
        print #song, music
        print #song, saturation
        CLOSE #song

if counter = 1 then music = 0

if map >= 1 and music = 1 then
    playwave ""
    playwave "music\music1.wav", loop
    else
        playwave ""
end if

[reload]
if game$ = "on" then
    if inventaire = 2 then goto [reload2]
    if sortbook = 2 then goto [reload2]
    if load = 1 then goto [reload2]
    close #3b
end if
[reload2]
load = 0
openW = 0

if map = 1 then
    goto [jeuhumain1]
else
    if map = 2 then
        goto [jeuhumain2]
    else
        if map = 3 then
            goto [jeuhumain3]
        else
            if map = 4 then
                goto [jeuhumain4]
            else
                if map = 5 then
                    goto [jeuhumain5]
                else
                    if map = 6 then
                        goto [jeuhumain6]
                    else
                        if map = 7 then
                            goto [jeuhumain7]
                        else
                            if map = 8 then
                                goto [jeuhumain8]
                            else
                                if map = 9 then
                                    goto [jeuhumain9]
                                else
                                    if map = 10 then
                                        goto [jeuhumain10]
                                    else
                                        if map = 11 then
                                            goto [jeuhumain11]
                                        else
                                            if map = 12 then
                                                goto [jeuhumain12]
                                            else
                                                if map = 13 then
                                                    goto [jeuhumain13]
                                                else
                                                    if map = 14 then
                                                        goto [jeuhumain14]
                                                    else
                                                        if map = 15 then
                                                            goto [jeuhumain15]
                                                        else
                                                            if map = 16 then
                                                                goto [jeuhumain16]
                                                            else
                                                                if map = 17 then
                                                                    goto [jeuhumain17]
                                                                else
                                                                    if map = 18 then
                                                                        goto [jeuhumain18]
                                                                    else
                                                                        if map = 19 then
                                                                            goto [jeuhumain19]
                                                                        else
                                                                            if map = 20 then
                                                                                goto [jeuhumain20]
                                                                            else
                                                                                if map = 21 then
                                                                                    goto [jeuhumain21]
                                                                                else
                                                                                    if map = 22 then
                                                                                        goto [jeuhumain22]
                                                                                    else
                                                                                        if map = 23 then
                                                                                            goto [jeuhumain23]
                                                                                        else
                                                                                            wait
                                                                                        end if
                                                                                    end if
                                                                                end if
                                                                            end if
                                                                        end if
                                                                    end if
                                                                end if
                                                            end if
                                                        end if
                                                    end if
                                                end if
                                            end if
                                        end if
                                    end if
                                end if
                            end if
                        end if
                    end if
                end if
            end if
        end if
    end if
end if

function fileExist(dir$,file$)
    dim info$(10, 10)
    files dir$,file$, info$(
    if val(info$(0, 0)) > 0 then
        fileExist = 1
    else
        fileExist = 0
    end if
end function

sub SimpleClick handle$, MouseX, MouseY
#3b "SetFocus; DrawSprites"
end sub

sub SimpleClick2 handle$, MouseX, MouseY
#2b "SetFocus; DrawSprites"
end sub



    [SimpleClick1]
    #3b.map, "drawsprites"
    mX = MouseX
    mY = MouseY

    if mX>int(18*lc) and mX<int((18*lc)+95) and mY>int(31*lc) and mY<int((31*lc)+50) then
        notice "Empire"
    end if
    #3b.map, "drawsprites"
    print #3b.map, "backcolor black ; place 50 208 ;\";" ";popTOTAL;" "
    wait





