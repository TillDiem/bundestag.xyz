# create an array with all the filer/dir inside ~/myDir
arrhtml=(Data/*/*.html)
arrmd=(Data/*/*.md)

for ((i=0; i<${#arrmd[@]}; i++)); do
	# Get Elevation from File
	arrtitle[$i]=$(cat ${arrmd[$i]} | grep "^title: " | sed 's/title: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrtitle[$i]}" ]; then
		arrtitle[$i]="Unbekannter Titel"
	fi
	# Get Elevation from File
	arrauthor[$i]=$(cat ${arrmd[$i]} | grep "author: " | sed 's/author: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrauthor[$i]}" ]; then
		arrauthor[$i]="Unbekannter Titel"
	fi
	arrabstract[$i]=$(cat ${arrmd[$i]} | grep "abstract: " | sed 's/abstract: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrabstract[$i]}" ]; then
		arrabstract[$i]="Unbekannter Titel"
	fi
done

echo '
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang="">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

  <link rel="stylesheet" href="../topbar.css" />
<link rel="stylesheet" href="Resources/blogindex.css" />
<div class="mainpart">
<h1> Bundestag - Zusammengefasst <a href="feed.xml" style="text-decoration: none; color: black"><button class="button1"> <img src="Resources/rss.svg" alt="rss logo" style="max-height: 1.5em"></button> </a>

</h1>
<br>

<p>Die Idee hinter diesem Blog ist eine regelmässige Zusammenfassung der Anträge der parlamentischen Opposition im Deutschen Bundestag.
Dies soll einerseit uns in die vom Bundestag behandelten Thematiken einführen, als auch eine Übersicht über die Parlamentsarbeit und Kultur liefern.
Beide Autoren sind juristische Laien und versuchen durch die regelmässige Beschäftigung mit dem Bundestag den Bürgerpflichten nachzukommen.</p>
<h2>Einträge der Anträge:</h2>
<ul>
'
for ((i=0; i<${#arrmd[@]}; i++)); do
	n=${#arrmd[@]}
	n=$((n-1))
echo '
<li> <a href="'${arrhtml[$((n-i))]}'" style="text-decoration:none;color:black"><font style="color:darkblue">'${arrtitle[$((n-i))]}'</font><div class="abstract">'${arrabstract[$((n-i))]}'</div> </a> <br></li>
<li style="list-style-type: none;"></li>'
done

echo '
</ul>

<h2>Referenzen: </h2>
<ul>
<li><a href="https://www.bundestag.de/drucksachen">Drucksachen (Anträge, kleine Anfragen etc.)</a>
<li><a href="https://www.bundestag.de/protokolle">Plenarprotokolle</a>
<li><a href="https://www.bundestag.de/rss">RSS Feeds aus dem Bundestag</a>
</ul>
</div>
</body>
</html>
'
