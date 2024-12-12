#!/usr/bin/env bash

echo "Um dieses Skript zu nutzen muss detex auf dem Rechner installiert sein"
echo "Unter macOS kann es mit dem folgenden Befehl installiert werden: brew install opendetex"

rm wordcounts.txt 2> /dev/null

detex thesis.tex > thesis.txt

# Removes everything before Einleitung and after Anhang
BEGINNING="Einleitung"
ENDING="Anhang"
while read -r p; do
  # end txt when end was found
  echo "$p" | grep $ENDING && break
  if [ "$FOUNDBEGIN" == "y" ]
  then
        echo "$p" >> wordcounts.txt
        # echo "$p" | sed 's/\[[\w. ]*\][[\w. ]*\]\w+\.\w+/ /g' >>wordcounts.txt
  fi
  # start txt when beginning was found
  echo "$p" | grep $BEGINNING >/dev/null && FOUNDBEGIN="y"
done <thesis.txt

echo
echo "Anzahl der Wörter vom Kapitel Einleitung bis Anhang:"
wc -w wordcounts.txt # zeilen, wörter, zeichen
rm wordcounts.txt 2> /dev/null
rm thesis.txt 2> /dev/null
