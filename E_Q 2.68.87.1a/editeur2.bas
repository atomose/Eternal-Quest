
  'EDITEUR
  nomainwin
      [retour]
      dim info$(10,10)
     FILEDIALOG "Open", DefaultDir$+"\bmp\map\*.bmp", Filename$ '--ci-dessous: grosse magouille
         xj= instr(Filename$, "map")+3 '----pour extraction du nom sec
         charge$ = right$(Filename$,len(Filename$)-xj) '---arrachage de ce qu'il y a devant
         map$ = left$(charge$,len(charge$)-4) '---arrachage de ce qu'il y a derrière

    WindowWidth = 1020
    WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/1.5)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    Global ncx, ncy, lc, SpriteCourant, caseValue
    Global optab
    GRAPHICBOX #3b.map, 0, 0, 1020, 600
    if op3b=1 then [pass3b]
    open "Editeur de Zones Réactives " for window as #3b
    if map$="" then [Quit]
    op3b=1
    [pass3b]
    #3b "trapclose [Quit]"
    #3b.map, "down"
    #3b.map, "setfocus"
    #3b.map, "When rightButtonUp Cotecase"' côtes en cases
    #3b.map, "When middleButtonDown Cotepix" 'côtes en pixels
    #3b.map "when leftButtonDown [SimpleClick]"
    #3b.map, "when leftButtonMove [SimpleClick]"    'pour tracer et enregistrer les limites.
    #3b.map, "when characterInput Touches"        'pour déplacer le personnage avec les flêches. la même flêche l'arrête.
    #3b.map, "font Comic_Sans_MS 8"
    #3b.map, "home; posxy CenterX CenterY"
    '--------------------------------------- Init Var -----------------------
    lc = 15    'dimension d'une case en pixels
    Gwidth = CenterX * 2
    Gheight = CenterY * 2
    dpx(1) = 0  :dpx(2) = 1 :dpx(3) = 0 :dpx(4) = -1
    dpy(1) = -1 :dpy(2) = 0 :dpy(3) = 1 :dpy(4) = 0    ' incrément de direction , pour la variables tableau
    ncx = int(Gwidth/lc)+1   'nbre de case en x
    ncy = int(Gheight/lc)+1   'nbre de case en y
    dim cas$(ncx,ncy) 'tableau chaine de toute la map
    caseValue$ = "z" ' valeur de la limite par défaut = mur.

    gosub [charge]
        loadbmp "MAP", "bmp\map\"+map$+".bmp"  ' LA CARTE à éditer.

    gosub [grid]
    gosub [montreLimites]
    goto [tabbord]
wait '----
[montreLimites]
    #3b.map, "backcolor blue; color yellow"
    for y = 1 to ncy
        for x = 1 to ncx'----if cas$(x,y)<>"x"-->si différent de "x" on affiche
            if cas$(x,y)<>"x" then #3b.map, "place ";(x*lc)-lc/2-2;" ";y*lc-3;" ;|";cas$(x,y)
        next '----"x" Partie libre (ça ne marchait pas avec: "", ni avec: " ")
    next
    #3b.map,"flush;discard"
return

[SimpleClick]
    #tab.va, "!contents? value$"
    caseValue$=value$
    mx = int(MouseX / lc)+1
    my = int(MouseY / lc)+1
    if mx>0 and mx<ncx and my>0 and my<ncy then
        cas$(mx,my) = caseValue$
       #3b.map, "backcolor blue; color blue"
       #3b.map, "place ";(mx-1)*lc+2;" ";(my-1)*lc+2
       #3b.map, "boxfilled ";mx*lc-1;" ";my*lc-1
       #3b.map, "color yellow"
       #3b.map, "place ";(mx*lc)-lc/2-2;" ";my*lc-3;" ;|";cas$(mx,my)
    end if
    #3b.map,"flush;discard"
wait
[grid]
    #3b.map, "drawbmp MAP 0 0" '----Déplacé d'en haut
    print #3b.map, "background MAP"
        #3b.map, "drawsprites"
    #3b.map, "color darkgray"
    for x = 1 to ncx
        #3b.map, "place ";x*lc;" 0"
        #3b.map, "goto ";x*lc;" ";ncy*lc  'traits verticaux de la grille
    next
    for y = 1 to ncy
        #3b.map, "place 0 ";y*lc
        #3b.map, "goto ";ncx*lc;" ";y*lc  'traits horizontaux de la grille
    next
    #3b.map,"flush;discard"
return
wait


[charge]
     redim cas$(ncx,ncy) 'on vide l'ancien tableau
     file$=map$+".txt"
    if fileExist(DefaultDir$+"\bmp\map\", file$) then
        open "bmp\map\"; file$ for input as #grid
        for y=1 to ncy
            for x=1 to ncx
            if eof(#grid) <> 0 then sortgrid=1: exit for 'test de fin de fichier
                LINE INPUT #grid, cas$(x,y)
            next
            if sortgrid=1 then exit for '2 for/next--> 2 exits par flag: "sortgrid"
        next
        close #grid
    else
        notice " "+chr$(13)+"Pas de fichier : "+ map$+".txt'...!"+chr$(13)+"Il faut donc traçer les limites de cette carte..."
        for y=1 to ncy '---on rempli la map de "x" (partie libre)
            for x=1 to ncx '---ce qui permet d'effacer (en remplaçant par: "x")
                cas$(x,y)="x"
            next
            if sortgrid=1 then exit for
        next
    end if
return
[save]
    filesave$= map$+".txt"
        confirm "Enregistrer les limites de cette carte ?"; answer$
        if answer$ = "yes" then
            open "bmp\map\"; filesave$ for output as #grid
            for y = 1 to ncy
                for x = 1 to ncx
                    #grid, cas$(x,y)
                next
            next
            close #grid
            notice "Enregistrement"+chr$(13)+"limites de la carte enregistrées dans le fichier"+chr$(13)+map$+".txt"
        end if
        goto [Quit]
wait

[tabbord] '----------------------- Tableau de Bord -------------------------
    if optab=1 then [passtab]
    WindowWidth = 200
    WindowHeight = 130
    UpperLeftX=20
    UpperLeftY=100
    BUTTON #tab.cart, "Carte", [carte], UL, 5, 10, 50, 20
    BUTTON #tab.grio, "Grid On", [gridon], UL, 60, 10, 60, 20
    BUTTON #tab.limo, "Limit On", [limiton], UL, 125, 10, 60, 20
    BUTTON #tab.casva, "Case Value", [caseval], UL, 10, 40, 70, 20
    textbox #tab.va, 90, 40, 30, 20
    BUTTON #tab.des, "Destroy", [destroy], UL, 10, 70, 50, 20
    BUTTON #tab.sav, "Save Limites Carte", [save], UL, 80, 70, 110, 20
    open "Tableau de bord" for window_nf as #tab
    [passtab]
    optab=1
    print #tab, "trapclose [Quittab]"
    #tab.va, caseValue$
wait '------------
[limiton] '----------------- Et.... Ses boutons ---------
    gosub [montreLimites]
wait
[carte]
    #3b.map, "drawbmp MAP 0 0" '----Déplacé d'en haut
    print #3b.map, "background MAP"
    #3b.map, "drawsprites"
wait
[gridon]
    gosub [grid]
wait
[destroy]
   kill$=map$+".txt"
   confirm "Vous allez Détruire toutes les données";reponse$
   if reponse$="no" then wait
   if reponse$="yes" then
      if fileExist(DefaultDir$+"\bmp\map\", kill$) then
         kill DefaultDir$+"\bmp\map\"+kill$
         #3b.map, "fill black"
         goto [retour]
      else
         notice "Le fichier: "+kill$+" n'existe pas encore."
      end if
   end if
wait

function fileExist(path$,filename$) ' gestion des fichiers (note: infos(10,10) en tête de code)
    files path$,filename$, info$()
    fileExist = val(info$(0, 0))
end function
Function text(x,y,msg$) '------fonction d'affichage de textes
    #3b.map,"color yellow;backcolor black"
    #3b.map,"Place ";x;" ";y;";|";msg$
End Function
 Sub Cotecase handle$, xClick, yClick  '----prise de cotes en cases
    #3b.map, "color yellow;backcolor black"
    xcase=int(xClick/lc)+1 'coord en N° de case
    ycase=int(yClick/lc)+1
    Print text(xClick,yClick,"xc = "+Str$(xcase))
    Print text(xClick,yClick+15,"yc = "+Str$(ycase))
 End Sub
 Sub Cotepix handle$, xClick, yClick  '-----prise de cotes en pixels
    #3b.map, "color yellow;backcolor black"
    xcase=int(xClick/lc)+1 'coord en N° de case
    ycase=int(yClick/lc)+1
    Print text(xClick,yClick,"xp = "+Str$(xClick))
    Print text(xClick,yClick+15,"yp = "+Str$(yClick))
 End Sub
wait
[Quittab]
    close #tab: optab=0
wait
[Quit]
    if optab=1 then close #tab:optab=0
    if map$<>"" then unloadbmp "MAP"
    close #3b
    END




