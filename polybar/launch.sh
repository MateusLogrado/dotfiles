#!/usr/bin/env bash

# Mata todas as barras em execução
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Captura as saídas conectadas em um array
readarray -t MONITORS < <(xrandr --query | grep " connected" | cut -d" " -f1)

# Lança a barra para cada monitor encontrado
for m in "${MONITORS[@]}"; do
    if [ -n "$m" ]; then
        echo "Lançando Polybar em: $m"
        MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybar-$m.log & disown
    fi
done