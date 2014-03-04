
    nomainwin
    WindowWidth = 450 :WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    atk = 0
    def = 0
    atkACTION = 0
    defACTION = 0
    atkPOWER = 0
    defPOWER = 0
    block = 0
    blockENEMI = 0
    attaque = 8
    defense = 3
    dmgENEMI = 7
    armENEMI = 4
    vieE = 60
    vieEtotal = 60
    vie = 85
    regen = 0.2
    regenE = 0.3
    healTotal = 85
    mana = 15
    manaTotal = 15
    manaE = 8
    manaEtotal = 8
    Spell1$ = "Fire ball"
    Sp1Dmg = 25
    Spell1cost = 6
    manaReg = 0.5
    manaRegE = 1

    graphicbox #main.map, 0, 0, 450, 630
    open "IA" for window_nf as #main

    #main, "trapclose [quit]"
    #main.map,"setfocus; when characterInput [control_touchea]"
    #main.map, "down"
    print #main.map, "flush"
    print #main.map, "font Times New Roman 10; color black"
    print #main.map, "backcolor white ; place 150 515 ;\"; "Attack"
    print #main.map, "backcolor white ; place 230 515 ;\"; "Defense"
    print #main.map, "backcolor white ; place 170 500 ;\"; atk
    print #main.map, "backcolor white ; place 250 500 ;\"; def
    print #main.map, "backcolor white ; place 150 30 ;\"; "Attack"
    print #main.map, "backcolor white ; place 230 30 ;\"; "Defense"
    print #main.map, "backcolor white ; place 170 50 ;\"; atkE
    print #main.map, "backcolor white ; place 250 50 ;\"; defE
    print #main.map, "backcolor white ; place 350 50 ;\"; vieE; " / "; vieEtotal
    print #main.map, "backcolor white ; place 350 70 ;\"; manaE; " / "; manaEtotal
    print #main.map, "backcolor white ; place 350 500 ;\"; vie; " / "; healTotal
    timer 100, [fight]
    wait

    [control_touchea]
    gosub[case]
    [fightSecure]
    if atk = 1 then gosub [atk]
    if Spell1Eaction = 4 then gosub [spellENEMI]
    if atkENEMI = 1 then gosub [atkENEMI]
    print #main.map, "backcolor white ; place 170 500 ;\"; atk
    print #main.map, "backcolor white ; place 250 500 ;\"; def
    print #main.map, "backcolor white ; place 170 50 ;\"; atkENEMI
    print #main.map, "backcolor white ; place 250 50 ;\"; defE
    print #main.map, "backcolor white ; place 340 50 ;\";"                                                                                                            "
    print #main.map, "backcolor white ; place 350 50 ;\"; vieE; " / "; vieEtotal
    print #main.map, "backcolor white ; place 340 70 ;\";"                                                                                                            "
    print #main.map, "backcolor white ; place 350 70 ;\"; manaE; " / "; manaEtotal
    print #main.map, "backcolor white ; place 340 500 ;\";"                                                                                                            "
    print #main.map, "backcolor white ; place 350 500 ;\"; vie; " / "; healTotal

    if vie <= 0 then
        timer 0
        notice "YOU LOSE !"
    wait
    end if
    if vieE <= 0 then
        timer 0
        notice "YOU WIN !"
    wait
    end if
    timer 100, [fight]
    wait

    [fight]
    timer 0
    atkACTION = atkACTION +1
    atkENEMIaction = atkENEMIaction +1
    defENEMIaction = defENEMIaction +1
    manaEaction = manaEaction +1
    regenAction = regenAction +1

    if atkACTION >= 15 then
        atkPOWER = 1
        atkACTION = 0
    end if
    defACTION = defACTION +1
    if defACTION >= 50 then
        defACTION = 0
        block = block + 1
    end if

    if atkENEMIaction >= 20 then
        atkENEMIaction = 0
        atkENEMIpower = 1
    end if

    if regenAction > 10 then
        regenAction = 0
        vie = vie +regen
        vieE = vieE +regenE
        if vie > healTotal then vie = healTotal
        if vieE > vieEtotal then vieE = vieEtotal
    end if

    if manaEaction > 20 then
        manaE = manaE + manaReg
        if manaE > manaEtotal then manaE = manaEtotal
        manaEaction = 0
        if manaE >= Spell1cost or Spell1Eaction>0 then Spell1Eaction = Spell1Eaction +1
    end if

    if defENEMIaction >= 40 then
        defENEMIaction = 0
        defENEMIpower = 1
        blockENEMI = blockENEMI + 1
    end if

    if atkENEMIpower = 1 then
    print #main.map, "backcolor white ; place 30 400 ;\";"                                                                                                            "
        atkENEMI = 1
        atkENEMIpower = 0
        target = int((rnd(1)+1)*2)
        if target <=2 then
            target = 1
            print #main.map, "backcolor white ; place 30 400 ;\";"   X                                                                                                         "
        end if
        if target >=3 then
            target = 2
            print #main.map, "backcolor white ; place 30 400 ;\";"                                                                                                   X         "
        end if

    end if
    if defENEMIpower = 1 then
        defENEMI = 1
        defENEMIpower = 0
    end if

    if block > 3 then block = 3
    if blockENEMI > 3 then blockENEMI = 3
    if block >0 then def =1
    if blockENEMI >0 then defE = 1
    if Spell1Eaction = 3 or Spell1Eaction = 4 then atakENEMI = 0
    goto [fightSecure]


    [case]
    select case
    case asc(right$(Inkey$,1))= _VK_UP : atkTOUCH = 1
    case asc(right$(Inkey$,1))= _VK_DOWN : atkTOUCH = 1
    case asc(right$(Inkey$,1))= _VK_LEFT : defTOUCH = 1 : goto [defpower]
    case asc(right$(Inkey$,1))= _VK_RIGHT : defTOUCH= 1 : goto [defpower]
    case Inkey$ = "z" or Inkey$ = "Z" : atkTOUCH = 1
    case Inkey$ = "s" or Inkey$ = "S" : atkTOUCH = 1
    case Inkey$ = "q" or Inkey$ = "Q" : defTOUCH = 1 : targetTouch = 1 : goto [defpower]
    case Inkey$ = "d" or Inkey$ = "D" : defTOUCH = 1 : targetTouch = 2 : goto [defpower]
    end select

    [fixe]
    if atkPOWER = 1 and atkTOUCH = 1 then
        atk = 1
        atkPOWER = 0
    end if
    if block = 0 then def = 0
    if blockENEMI = 0 then defE = 0
    return

    [defpower]
    if block >= 1 and defTOUCH = 1 then
        Bcontrataque = 1
        Scontrataque = 1
        block = block - 1
        defBlock = 1
    end if
    if defBlock = 1 then
        defBlock = 0
        defTOUCH = 0
        print #main.map, "backcolor white ; place 100 80 ;\";"                                                                                                            "
        wait
    end if
    goto [fixe]



    [atk]
    timer 0
    atk = 0
    damages = int((rnd(attaque)*attaque+1)- armENNEMI)
    if blockENEMI > 0 then
        damages = 0
        blockENEMI = blockENEMI -1
    end if

if damages <= 0 then
    print #main.map, "backcolor white ; place 100 80 ;\";"                                                                                                            "
    print #main.map, "backcolor white ; place 130 80 ;\";"The enemies dodge your attacks!"
    vieE = vieE
else
    print #main.map, "backcolor white ; place 100 80 ;\";"                                                                                                            "
    print #main.map, "backcolor white ; place 200 80 ;\";"- ";damages
    vieE = vieE - damages
end if
if vieE < 0 then vieE = 0
return


    [atkENEMI]
    timer 0

    if target = 1 and targetTouch = 1 then randomTouch = 1
    if target = 2 and targetTouch = 2 then randomTouch = 1

    atkENEMI = 0
    contrataque = int((rnd(dmgENEMI)*dmgENEMI+1)-defense/2)

    if Bcontrataque =1 and randomTouch = 1 then
        contrataque = 0
        Bcontrataque = 0
    end if
if contrataque <= 0 then
    print #main.map, "backcolor white ; place 100 440 ;\";"                                                                                                            "
    print #main.map, "backcolor white ; place 100 460 ;\";"                                                                                                            "
    print #main.map, "backcolor white ; place 145 460 ;\";"You dodge the attack!"
    vie = vie
    else
        print #main.map, "backcolor white ; place 100 460 ;\";"                                                                                                            "
        print #main.map, "backcolor white ; place 100 440 ;\";"                                                                                                            "
        print #main.map, "backcolor white ; place 150 460 ;\";"Sharp blow : - ";contrataque; " hp"
        vie = vie - contrataque
end if

    if Spell1Eaction = 1 then
        print #main.map, "backcolor white ; place 100 440 ;\";"                                                                                                        "
        print #main.map, "backcolor white ; place 115 440 ;\";"Preparation of enemy magic spell!"
        manaE = manaE - Spell1cost
    end if
    if Spell1Eaction < 3 then Scontrataque = 0
    goto [NOspell]

    [spellENEMI]
    if contrataque <= 0 then
        Scontrataque = 1
        randomTouch = 1
    end if
    if Scontrataque = 1 or Scontrataque = 0 and randomTouch = 0 then
        vie = vie - Sp1Dmg
        Spell1Eaction = 0
        print #main.map, "backcolor white ; place 100 440 ;\";"                                                                                                            "
        print #main.map, "backcolor white ; place 100 460 ;\";"                                                                                                            "
        print #main.map, "backcolor white ; place 130 440 ;\";"Enemy's fire ball : "; "- "; Sp1Dmg; " hp!"
    end if
    if Scontrataque = 1 and randomTouch = 1 then
        Spell1Eaction = 0
        Scontrataque = 0
        print #main.map, "backcolor white ; place 100 440 ;\";"                                                                                                            "
        print #main.map, "backcolor white ; place 100 460 ;\";"                                                                                                            "
        print #main.map, "backcolor white ; place 145 440 ;\";"Your counterspell !"
    end if
    [NOspell]
    if vie > healTotal then vie = healTotal
    if vie < 0 then vie = 0
    randomTouch = 0
    if Spell1Eaction >= 4 then Spell1Eaction = 0
return



    [quit]
    close #main
    end

    [I2]
    wait
