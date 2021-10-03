# Setup 

Das `setup_website` skript generiert mithilfe der `generator_*` skripte die notwendigen Seiten und fügt sie dem Git repo hinzu. 
Der Editor wird aufgerufen um eine commit message einzugeben und dann wird auf git gepusht. 
Damit es nicht zu Versionsproblemen kommt, * muss * vor dem Ausführen von `setup_bundestag` einmal `git pull` ausgeführt werden.
Um die Artikel dann zu publizieren, werden diese mi `rsync` auf bundestag.xyz gecloned. 
Dazu muss `sync_bundestag` entsprechend dem lokalen Speicherort angepasst werden. 


# Workflow

1. Schreiben eines Artikels, folgend der Konvention bezüglich Metadaten in `/Resources/template.md`
2. `git pull`
3. `setup_website` 
4. `sync_bundestag`
