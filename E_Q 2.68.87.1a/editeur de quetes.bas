nomainwin
WindowWidth = 400
WindowHeight = 160
UpperLeftX=int((DisplayWidth-WindowWidth)/5)
UpperLeftY=int((DisplayHeight-WindowHeight)/3)
statictext #1.a,"Quête optionelle : La sacoche", 70, 10, 300, 50
statictext #1.b,"''Tiens, un étranger.... Ce n'est pas avec ce que tu as que je mangerais à ma faim le morveux ! Bouge de la avant que je te face couter à ma lame.''", 20, 45, 350, 50
statictext #1.c,"Voulez-vous attaquez ?", 20, 100, 150, 50
button #1, "Oui", [nf], LR, -200, -120,80,25
button #1, "Non", [nf], LR, -290, -120,80,25
open "" for dialog_modal_nf as #1
print #1.a, "!font times_new_roman 16 bold italic"
print #1.b, "!font times_new_roman 10 italic"
print #1.c, "!font times_new_roman 10 bold"
#1,"trapclose [w]"
wait

[nf]
wait

[w]
close #1
