#!/bin/bash
# Директорія, з якої беру файли, де зберігаю архів та старий архів,а також дерикторія для логів
source_dir=~/linux_p2
backup_dir=~/linux_p2/backup
old_backup_dir=~/linux_p2/old_backup
log_dir=~/linux_p2/log

# Створення директорії log_dir та backup_dir, при умові що вона існує,далі отримуємо поточну дату в форматі ISO
mkdir -p $log_dir
mkdir -p $backup_dir
current_date=$(date +%F)

# Змінна для лічильника файлів
count=1

# Цикл архівації
for file in $source_dir/*; do
  if [ -f "$file" ]; then
    # Отримання назви файлу та створення архіву з файлом та виведення назви файла
    file_name=$(basename "$file")
    tar -czf "$backup_dir/$count.$file_name_$current_date.tar.gz" "$file"
    echo "Archiving a file: $file_name"

    # Збільшуємо лічильник файлів
    ((count++))
  fi
done

# Переміщення старих архівів в директорію old_backup
find "$backup_dir" -type f -mmin +3 -exec mv {} "$old_backup_dir" \;

# Добавляємо запис до лог-файлу backup.log
echo "Скрипт запущено о $current_date" >> "$log_dir/backup.log"

# Додатково, записуємо логи з помилками в err_backup.log
# Якщо скрипт видасть помилку, ці помилки будуть записані сюди
./script.sh 2>> "$log_dir/err_backup.log"

echo "Завершено!"