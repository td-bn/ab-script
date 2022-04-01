#!/bin/bash

source variables.sh

benchmark() {
  path="${1//\//-}"
  dir="${PWD}/out/${path}"
  mkdir -p $dir
  csv="${dir}/data.csv"
  txt="${dir}/data.txt"
  api="${host}${1}"
  ab -k -q -c 100 -n 1000 -H "${auth}" -e $csv $api | tee $txt
}

for i in "${paths[@]}"
do
  benchmark $i
done
