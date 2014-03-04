
nomainwin

    WindowWidth = 880
    WindowHeight = 538
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    Global ncx, ncy, lc, SpriteCourant, caseValue

    lc = 15    'dimension d'une case en pixels

    open "Le Donjon De Sheidra Map N°1" for graphics_nsb_nf as #3b
    #3b "trapclose Quit"
    #3b "font Comic_Sans_MS 8"
    #3b "home; posxy CenterX CenterY"
    Gwidth = CenterX * 2
    Gheight = CenterY * 2
    dpx(1) = 0  :dpx(2) = 1 :dpx(3) = 0 :dpx(4) = -1
    dpy(1) = -1 :dpy(2) = 0 :dpy(3) = 1 :dpy(4) = 0    ' incrément de direction , pour la variables tableau
    ncx = int(Gwidth/lc)+1   'nbre de case en x
    ncy = int(Gheight/lc)+1   'nbre de case en y
    dim cas(ncx,ncy)  'variable tableau de toutes la map.
    dim info$(1,1)
    caseValue = 1   ' valeur de la limite par défaut = mur.

    loadbmp "MAP", "bmp\map\maphum2.bmp"  ' LA CARTE à éditer.

    sprites$ = "perso1d perso2d perso3d perso4d perso1s perso2s perso3s perso4s "+_
               "perso1q perso2q perso3q perso4q perso1z perso2z perso3z perso4z"
    for s = 1 to 16
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next
    #3b "addsprite perso1 perso1z perso2z perso3z perso4z"  'création des 4 sprites pour chaque futures direction de déplacement...
    #3b "addsprite perso2 perso1d perso2d perso3d perso4d"
    #3b "addsprite perso3 perso1s perso2s perso3s perso4s"
    #3b "addsprite perso4 perso1q perso2q perso3q perso4q"

    #3b "down"
    #3b "drawbmp MAP 0 0"
    #3b "color darkgray"
    for x = 1 to ncx
        #3b "place ";x*lc;" 0"
        #3b "goto ";x*lc;" ";ncy*lc  'traits verticaux de la grille
    next
    for y = 1 to ncy
        #3b "place 0 ";y*lc
        #3b "goto ";ncx*lc;" ";y*lc  'traits horizontaux de la grille
    next

    #3b "getbmp bckgrd1 0 0 ";Gwidth;" ";Gheight   'mémorise la grille pour servir de background au sprite "curs"
    #3b "background bckgrd1"

    pCX = 14  ' position initiale du personnage (en cases)
    pCY = 18

    for SpriteCourant = 1 to 4
        #3b "spritexy perso";SpriteCourant;" ";pCX*lc;" ";pCY*lc   'place tous les sprites du personnage là.
        #3b "cyclesprite perso";SpriteCourant;" 1"
        #3b "spritevisible perso";SpriteCourant;" off"
    next
    SpriteCourant = 3
    #3b "spritevisible perso";SpriteCourant;" on"
    #3b "drawsprites"   'affiche le sprite courant.
    #3b "setfocus"

    if fileExist(DefaultDir$, "LastMap.txt") then         ' vérifie l'existance d'un fichier des limites.
        open "LastMap.txt" for input as #grid
        for y=1 to ncy
            LINE INPUT #grid, grid$
            for x=1 to ncx
                cas(x,y)=val(mid$(grid$,x,1))
            next
        next
        close #grid
    else
        notice " "+chr$(13)+"Pas de fichier 'LastMap.txt'...!"+chr$(13)+"Il faut donc traçer les limites de cette carte..."
    end if
    call montreLimites
    call aide

    #3b "when leftButtonMove SimpleClick"    'pour tracer et enregistrer les limites.
    #3b "when leftButtonDouble DoubleClick"    'pour déplacer le personnage à la souris...
    #3b "when characterInput Touches"        'pour déplacer le personnage avec les flêches. la même flêche l'arrête.

wait

sub Touches handle$, Inkey$
    key$ = right$(Inkey$,1)
    select case
    case key$ = chr$(27) : call Quit "#3b"  'ESC
    case key$ = chr$(32) : #3b "background MAP ; drawsprites"   ' ESPACE
    case instr("0123456789",key$) > 0 : caseValue = val(key$)   'VALEUR que cette case prendra lorsqu'on trace les limites.
    case lower$(key$) = "g" : #3b "background bckgrd1 ; drawsprites"
    case lower$(key$) = "h" : call aide
    case lower$(key$) = "m" : call montreLimites
    case lower$(key$) = "e"
        confirm "Enregistrer les limites de cette carte ?"; answer$
        if answer$ = "yes" then
            ' le fichier des limites actuelles est créé.
            open "LastMap.txt" for output as #grid
            for y = 1 to ncy
                case$ = ""
                for x = 1 to ncx
                    case$ = case$ + str$(cas(x,y))
                next
                #grid, case$
            next
            close #grid
            notice "Enregistrement"+chr$(13)+"limites de la carte enregistrées dans le fichier"+chr$(13)+"LastMap.txt"
        end if
    end select
end sub

sub montreLimites
    #3b "backcolor blue; color yellow"
    for y = 1 to ncy
        for x = 1 to ncx
            if cas(x,y) then #3b "place ";(x*lc)-lc/2-2;" ";y*lc-3;" ;|";cas(x,y)
        next
    next
end sub

sub aide
    WindowWidth = 660
    WindowHeight = 390
    UpperLeftX=int((DisplayWidth-WindowWidth)/10)
    UpperLeftY=int((DisplayHeight-WindowHeight)/10)
    statictext #help.1 "TOUCHES UTILES :",                                                                    10, 25, WindowWidth, 25
    statictext #help.2 "-  m   =   affiche les limites (le contenu du fichier .txt).",                        10, 65, WindowWidth, 25
    statictext #help.3 "-  Espace   =   ne montre que la carte.",                                             10, 95, WindowWidth, 25
    statictext #help.4 "-  0123456789  =   pavé numérique -> valeur de la case lors du traçage des limites.", 10, 125, WindowWidth, 25
    statictext #help.5 "-  e   =   Enregistre les limites actuelles dans le fichier LastMap.txt.",            10, 155, WindowWidth, 25
    statictext #help.6 "Esc   =   quitter sans rien modifier (= croix de la fenêtre en haut à gauche).",      10, 185, WindowWidth, 25
    statictext #help.7 "Pour TRACER une limite : maintient du clic gauche + déplacer la souris.",             10, 215, WindowWidth, 25
    statictext #help.8 "Pour déplacer le personnage : Double-clic sur la destination voulue.",                10, 245, WindowWidth, 25
    statictext #help.9 "-  g   =   grille.",                                                                  10, 275, WindowWidth, 25
    statictext #help.10 "-  h   =   cette aide.",                                                             10, 325, WindowWidth, 25
    open "Aide" for dialog_nf_modal as #help
    #help "trapclose [QuitAide]"
    #help.1 "!font Courrier_New 12 bold underscore"
    for t = 2 to 10 : win$ = "#help.";t : #win$ "!font Courrier_New 12 bold" : next
    wait
    [QuitAide]
    close #help
    WindowWidth = 880     ' redonne les valeurs d'origine à la fenêtre principale.
    WindowHeight = 538
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
end sub

sub SimpleClick handle$, MouseX, MouseY
    mx = int(MouseX / lc)+1
    my = int(MouseY / lc)+1
    #3b "spritevisible perso";SpriteCourant;" off; drawsprites"
    if mx>0 and mx<ncx and my>0 and my<ncy then
        cas(mx,my) = caseValue
        call drawcell mx, my, cas(mx,my)
    end if
    unloadbmp "bckgrd1"   'décharge la RAM de l'image...
    #3b "getbmp bckgrd1 0 0 ";WindowWidth;" ";WindowHeight   'mémorise la grille pour servir de background au sprite
    #3b "background bckgrd1"
    #3b "spritevisible perso";SpriteCourant;" on; drawsprites"
end sub

sub DoubleClick handle$, MouseX, MouseY    'double clic sur un point de destination...
    #3b "when leftButtonMove"
    mX = MouseX
    mY = MouseY
    icp = 6   'incrément de déplacement en pixels.
    #3b "spritexy? perso";SpriteCourant;" cursX cursY"   'coordonnées actuelles du personnage   <------
    dir = direction(cursX,cursY,mX,mY)    'fonction qui donne la direction du déplacement... destinée à utiliser le sprite adéquat.
    for s=1 to 4 : #3b "spritevisible perso";s;" off" : next
    SpriteCourant = dir
    #3b "spritexy perso";SpriteCourant;" ";cursX;" ";cursY
    #3b "spritevisible perso";SpriteCourant;" on"  'ne montre QUE le sprite concerné par la direction choisie.
    do
        #3b "spritexy? perso";SpriteCourant;" cursX cursY"
        cx = int(cursX/lc)+1             'position du sprite exprimé en n° de case pour la variable tableau
        cy = int(cursY/lc)+1
        if cx+dpx(dir)>0 and cx+dpx(dir)<ncx and cy+dpy(dir)>0 and cy+dpy(dir)<ncy and cas(cx+dpx(dir),cy+dpy(dir)) = 0 then 'and cas(cx+dpx(dir),cy+1+dpy(dir)) = 0 then  'reste dans la map et pas de mur...
            nx = cursX + dpx(dir)*icp
            ny = cursY + dpy(dir)*icp
            #3b "spritexy perso";SpriteCourant;" ";nx;" ";ny      'cheminement du sprite... tranquilou...
            #3b "drawsprites"
            call pause 90
        else
            sortir = 1
        end if
        if cas(cx+dpx(dir),cy+dpy(dir)) = 2 then notice "aller map 1"
        if cas(cx+dpx(dir),cy+dpy(dir)) = 3 then notice "aller map 3"
        if cas(cx+dpx(dir),cy+dpy(dir)) = 4 then notice "Aie ! c'est des cailloux !!"

        if (dir = 2 and nx >= mX) or (dir = 4 and nx <= mX) or (dir = 1 and ny <= mY) or (dir = 3 and ny >= mY) then sortir = 1  'on est arrivé en l'endroit du clic de souris...
    loop until sortir
    #3b "when leftButtonMove SimpleClick"
end sub

function direction(dx,dy,ax,ay)    'fonction qui donne la direction du déplacement... destinée à utiliser le sprite adéquat.
    dirX = ax - dx
    dirY = ay - dy
    if abs(dirX) < abs(dirY) then sens = 1 else sens = 2   '1 = vertical  2 = horizontal
    select case
    case sens = 1 : if dirY > 0 then direction = 3 else direction = 1   'direction à prendre: 1 = HAUT,   3 = BAS
    case sens = 2 : if dirX > 0 then direction = 2 else direction = 4   '                     2 = DROITE, 4 = GAUCHE
    end select
end function

sub drawcell xx, yy, v      'montre le contenu d'une case
    #3b "backcolor blue; color blue"
    #3b "place ";(xx-1)*lc+2;" ";(yy-1)*lc+2
    #3b "boxfilled ";xx*lc-1;" ";yy*lc-1
    ' option d'affichage valeur des cases...
    #3b "color yellow"
    #3b "place ";(xx*lc)-lc/2-2;" ";yy*lc-3;" ;|";v
end sub

sub pause temp
    timer temp, [suit]
    wait
    [suit]
    timer 0
end sub

function fileExist(path$,filename$)
    files path$,filename$, info$(
    fileExist = val(info$(0, 0))
end function

sub Quit handle$
    unloadbmp "MAP"
    sprites$ = "perso1d perso2d perso3d perso4d perso1s perso2s perso3s perso4s "+_
               "perso1q perso2q perso3q perso4q perso1z perso2z perso3z perso4z"
    for s = 1 to 16
        unloadbmp word$(sprites$,s)
    next
    close #3b
    END
end sub

