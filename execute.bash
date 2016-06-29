#!/bin/sh


while [ $# -gt 1 ]
do
  key="$1"

  case $key in
      --config)
      config="$2"
      shift # past argument
      ;;

      *)
        # unknown option
      ;;
  esac
  shift # past argument or value
done

echo "count(key:value) = $(cat $config | wc -l)"

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
