#!/usr/bin/env bash
# Calculate simple interest from principal, annual percentage rate, and years.
set -euo pipefail

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual rate of interest (%): " rate
read -r -p "Enter the time period in years: " time

for value in "$principal" "$rate" "$time"; do
  if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: enter non-negative numbers only." >&2
    exit 1
  fi
done

awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "Simple interest: %.2f\n", p * r * t / 100 }'
