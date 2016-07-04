#!/bin/sh

# Aufgabe 2D: Folgender Aufruf wird verwendet um die ausgabe in die Datei config.json auszugeben
# ./execute.bash --config config.txt > config.json

while [ $# -gt 1 ]
do
  key="$1"

  case $key in
      --config)
      config="$2"
      shift
      ;;

      *)
      ;;
  esac
  shift
done

if [ "$config" = "" ]
then
  exit 1
elif [ "$config" = "-" ]
then
  stdin=$(cat)
  lines=$(echo "$stdin" | cat | wc -l)


  i=0
  echo "{"
  while read line
  do
    i=$((i + 1))
    if [ $i -lt  $lines ]; then
      echo $line | awk '{print " \"" $1 "\" : \"" $3 "\","}' | sed "s/""'""//g"
    else
      echo $line | awk '{print " \"" $1 "\" : \"" $3 "\""}' | sed "s/""'""//g"
    fi
  done < <(echo "$stdin")

else
  lines=$(cat $config | wc -l)
  i=0
  echo "{"
  while read line
  do
    i=$((i + 1))
    if [ $i -lt  $lines ]; then
      echo $line | awk '{print " \"" $1 "\" : \"" $3 "\","}' | sed "s/""'""//g"
    else
      echo $line | awk '{print " \"" $1 "\" : \"" $3 "\""}' | sed "s/""'""//g"
    fi
  done < $config
  echo "}"
fi

# Das war Aufgabe 2A, wurde auskommentiert damit eine korrekte JSON-Ausgabe für Aufgabe 3C erzeugt wird.
# echo "count(key:value) = $(cat $config | wc -l)"
