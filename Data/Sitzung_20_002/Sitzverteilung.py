from numpy import *
#               CDU/CSU          SPD       AFD      FDP      Linke    Gruene
Votes = array([[8775471+2402827, 11955434, 4803902, 5319952, 2270906, 6852206]])
NumberSeats = int(input("Anzahl zu vergebender Sitze:\n"))


FractionsOfSeats=array([[0,0,0,0,0,0]])

# Wir fuellen die Wahlergebnisse und bestimmen die Werte nach St. Leguere
for i in linspace(0,NumberSeats,NumberSeats+1):
    FractionsOfSeats=append(FractionsOfSeats, around(Votes/(i+0.5)), axis=0)

for i in range(NumberSeats):
    result = where(FractionsOfSeats == amax(FractionsOfSeats))
    FractionsOfSeats[0,result[1]]+=1
    FractionsOfSeats[result]=0
    #print(FractionsOfSeats)


print("Sitzverteilung:  ")

print("CDU/CSU SPD AFD FDP Linke Gruene")
print((around(FractionsOfSeats)[0,:]))
