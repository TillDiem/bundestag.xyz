arrmd=(Data/*/*.md)
arrnames=($(ls Data/*/*.md | sed 's/md/html/g'))

for ((i=0; i<${#arrmd[@]}; i++)); do
	#echo ${arrmd[$i]}
	#arrnames[$i]=$(cat ${arrmd[$i]} | grep "name: " | sed 's/name: //g' | sed 's/\s/_/g' | sed 's/$/.html/g')
	#echo ${arrnames[$i]}
#	pandoc -s "${arrmd[$i]}" --template Resources/template.html -o "${arrnames[$i]}"

	pandoc -s "${arrmd[$i]}" --template Resources/template_blogpost.html -o "${arrnames[$i]}"
done
