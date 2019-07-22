#!/bin/bash

set +x

while true; do
    COINTOSSES=$((RANDOM % 10))

    for i in $(seq 0 $COINTOSSES); do
        SLEEP=$((1 + RANDOM % 2))
        NUM=$((1 + RANDOM % 5))
        curl -XPOST http://rails:3000/cointosses\?num=$NUM
        sleep $SLEEP
    done

    DICEROLLS=$((RANDOM % 10))

    for i in $(seq 0 $DICEROLLS); do
        SLEEP=$((1 + RANDOM % 2))
        ROLLS=$((1 + RANDOM % 4))
        DICE=$((1 + RANDOM % 20))

        SPEC="${ROLLS}d${DICE}"
        curl -XPOST http://rails:3000/dicerolls\?spec=$SPEC
        sleep $SLEEP
    done
done
