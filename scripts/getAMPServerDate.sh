#!/bin/bash -xl

shopt -s extglob # Required to trim whitespace; see below

BOGUS_URL="http://api2.iheart.com/api/revision.txt"
SERVER_DATE=""

while IFS=':' read key value; do
    # trim whitespace in "value"
    value=${value##+([[:space:]])}; value=${value%%+([[:space:]])}

    if [ "$key" = "Date" ]; then
      SERVER_DATE=$value
    fi

done < <(curl -sI $BOGUS_URL)

if [ -z "$SERVER_DATE" ]; then
  echo "fall back to regular date" >&2
  echo `date +%Y%m%d`
  exit 0
fi

# output as YYYYMMDD
SERVER_DATE=`date -j -f "%a, %d %b %Y %H:%M:%S %Z" "$SERVER_DATE" "+%Y%m%d" 2> /dev/null`
if [ $? -ne 0 ]; then
  echo "fall back to regular date" >&2
  echo `date +%Y%m%d`
  exit 0
fi

echo "outputting server date = $SERVER_DATE" >&2
echo $SERVER_DATE
exit 0
