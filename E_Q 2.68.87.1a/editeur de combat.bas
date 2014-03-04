
nomainwin

vieE1 = 120
E1PM = 8
E1atk = 14
E1def = 4

vieE = vieE1
vieETotal = 120
EPM = E1PM
EPMTotal = 8
Eatk = E1atk
Edef = E1def

vie = 203
healTotal = 203
PM = 12
PMTotal = 12
atk = 21
def = 3
Qvoleur = 0



[combat]
WindowWidth=1020:WindowHeight=600
UpperLeftX=int((DisplayWidth-WindowWidth)/2) : UpperLeftY=int((DisplayHeight-WindowHeight)/2)

bmpbutton #3c, "bmp\courir.bmp", [quit], LR, 11, 444

sprites$ = "beta"
    for s = 1 to 1
        loadbmp word$(sprites$,s), "bmp\"+word$(sprites$,s)+".bmp"
    next

loadbmp"MAP", "bmp\fondCombat.bmp"
'bmpbutton #3c.Indic, "bmp\beta.bmp", [w], LR, -25,-25
graphicbox #3c.map, 0, 0, 1050, 650
button #3c.attaque, "attaquer" , [attaque], LR, 700, 476,135,20
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
print #3c.map, "backcolor black ; place 850 495 ;\";" ";vie
print #3c.map, "backcolor black ; place 890 495 ;\";" / "
print #3c.map, "backcolor black ; place 920 495 ;\"; healTotal;" "

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
print #3c.map, "backcolor black ; place 920 495 ;\"; healTotal;" "

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
    vie = vie
else
    print #3c.map, "backcolor black ; place 350 540 ;\";"                                                                                                            "
    print #3c.map, "backcolor black ; place 420 540 ;\";"Vous recevez ";contrataque;" dommages !"
    vie = vie - contrataque
        if vie > healTotal then vie = healTotal
end if

if vie <= 0 then goto [mort]
if vieE <= 0 then goto [win]

print #3c.map, "flush"
print #3c.map, "backcolor black ; place 850 495 ;\";"             "
print #3c.map, "backcolor black ; place 850 495 ;\";" ";vie
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

print #3c.map, "flush"
print #3c.map, "backcolor black ; place 850 495 ;\";"             "
print #3c.map, "backcolor black ; place 850 495 ;\";" ";vie
print #3c.map, "backcolor black ; place 850 520 ;\";"             "
print #3c.map, "backcolor black ; place 850 520 ;\";" ";PM
print #3c.map, "backcolor black ; place 110 60 ;\";"             "
print #3c.map, "backcolor black ; place 110 60 ;\";" ";vieE
print #3c.map, "backcolor black ; place 110 85 ;\";"             "
print #3c.map, "backcolor black ; place 110 85 ;\";" ";EPM
wait




[mort]
notice " vous ètes hors combat "
close #3c
if questOp = 1 then Qvoleur = 2
wait
[win]
notice " vous avez gagnez "
close #3c
if questOp = 1 then Qvoleur = 1
goto[w]

[confirmQ1]
confirm "Etes vous sûr de votre choix ?";choix$
if choix$ = "no" then [Q1voleurfix]
Qvoleur = 1
close #1
#3b,"SpriteVisible voleur off"
#3b,"drawsprites"
wait

[quit]
close #3c
end
[w]
wait
