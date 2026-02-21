#!/bin/bash

END_TIME="${1:-17:00}"

now_h=$(date +%H)
now_m=$(date +%M)
now_total=$((10#$now_h * 60 + 10#$now_m))

end_h=${END_TIME%:*}
end_m=${END_TIME#*:}
end_total=$((10#$end_h * 60 + 10#$end_m))

diff=$((end_total - now_total))

echo "Current time: $(date +%H:%M)"

if [ $diff -le 0 ]; then
  echo "Work day already ended."
  exit 0
fi

hours=$((diff / 60))
mins=$((diff % 60))

echo "Work day ends after ${hours} hours and ${mins} minutes."
