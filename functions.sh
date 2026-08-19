#!/bin/bash
check_status() {
  if [[ -f "$1" ]]; then
    echo "✔ Fayl mavjud: $1"
  else
    echo "✘ Fayl topilmadi: $1"
  fi
}

check_status "backup.sh"
check_status "yoq_fayl.txt"
