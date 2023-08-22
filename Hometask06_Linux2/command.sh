#!/bin/bash

#версія 1

#mkdir -p ~/linux_p2 && cd ~/linux_p2 && touch {1..20}.txt && dd if=/dev/urandom of={1..20}.txt bs=1024 count=1
# ~/linux_p2 створює дерикторію де умова mkdir -p ~/linux_p2 якщо вона створена
# далі переходить у створену дерикторію cd ~/linux_p2
# Створює 20 файлів .txt командою =.>   touch {1..20}.txt
# Запис рандомних даних у файли Командою  =>    dd if=/dev/urandom of={1..20}.txt bs=1024 count=1

#версія 2
#mkdir -p ~/linux_p2 && cd ~/linux_p2 && touch {1..20}.txt && for i in {1..20}; do dd if=/dev/urandom of="$i.txt" bs=1024 count=1; done && echo 'done' > command.sh && chmod +x command.sh

#for i in {1..20}; do touch ${i}.txt;


mkdir -p ~/linux_p2 && cd ~/linux_p2 && for i in {1..20}; do touch ${i}.txt && dd if=/dev/urandom of="${i}.txt" bs=1024 count=1; done && echo 'done' > command.sh && chmod +x command.sh