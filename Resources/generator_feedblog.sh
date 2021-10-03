# create an array with all the filer/dir inside ~/myDir
arrhtml=(Data/*/*.html)
arrmd=(Data/*/*.md)
arrmain=(Data/*/*.html)
for ((i=0; i<${#arrmd[@]}; i++)); do
	# Get Elevation from File
	arrtitle[$i]=$(cat ${arrmd[$i]} | grep "^title: " | sed 's/title: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrtitle[$i]}" ]; then
		arrtitle[$i]="Unbekannter Titel"
	fi
	arrsubtitle[$i]=$(cat ${arrmd[$i]} | grep "subtitle: " | sed 's/subtitle: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrtitle[$i]}" ]; then
		arrtitle[$i]="Unbekannter Titel"
	fi

	# Get Elevation from File
	arrauthor[$i]=$(cat ${arrmd[$i]} | grep "author: " | sed 's/author: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrauthor[$i]}" ]; then
		arrauthor[$i]=""
	fi
	arrdate[$i]=$(cat ${arrmd[$i]} | grep "date: " | sed 's/date: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrdate[$i]}" ]; then
		arrdate[$i]=""
	fi
	arrtopic[$i]=$(cat ${arrmd[$i]} | grep "topic: " | sed 's/topic: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrtopic[$i]}" ]; then
		arrtopic[$i]=""
	fi
	arrcategory[$i]=$(cat ${arrmd[$i]} | grep "category: " | sed 's/category: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrcategory[$i]}" ]; then
		arrcategory[$i]=""
	fi
	arrabstract[$i]=$(cat ${arrmd[$i]} | grep "abstract: " | sed 's/abstract: //g')
	# IF no image is provied use standrd one
	if [ -z "${arrabstract[$i]}" ]; then
		arrabstract[$i]=""
	fi
	arrmain[$i]=$(cat ${arrhtml[$i]} | tail -n +10 | sed 's/<\/body>//g')
	# IF no image is provied use standrd one
	if [ -z "${arrabstract[$i]}" ]; then
		arrmain[$i]="Unbekannter Titel"
	fi
done

echo '
<rss version="2.0">
	<channel>
	  <title>Bundestag - Zusammengefasst</title>
	  <link>https://bundestag.xyz/feed.xml</link>
          <description>Zusammenfassungen der Anträge im Deutschen Bundestag</description>
	  <language>de_de</language>
'
for ((i=0; i<${#arrmd[@]}; i++)); do
	n=${#arrmd[@]}
echo '

	<item>
	<title>'${arrtitle[$((n-i-1))]}'</title>
	<pubDate>'${arrdate[$((n-i-1))]}'</pubDate>
	<link>https://dieminger.ch/blog/'${arrhtml[$((n-i-1))]}'</link>
		<description>
		<![CDATA[ '${arrmain[$((n-i-1))]}' ]]></description></item>
	'
done

echo '
	</channel>
</rss>
'
