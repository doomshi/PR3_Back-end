tasks = []

def show_menu
  puts "\nМеню:"
  puts "1. Додати нову задачу"
  puts "2. Показати всі задачі"
  puts "3. Видалити задачу (за номером)"
  puts "4. Вийти"
  print "Оберіть опцію: "
end

def list_tasks(tasks)
  if tasks.empty?
    puts "Список задач порожній."
  else
    puts "\nПоточні задачі:"
    tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end
end

def add_task(tasks)
  print "Введіть опис нової задачі: "
  task = gets.chomp
  tasks << task
  puts "Задачу додано!"
  list_tasks(tasks)
end

def delete_task(tasks)
  list_tasks(tasks)
  return if tasks.empty?

  print "Введіть номер задачі для видалення: "
  index = gets.to_i

  if index.between?(1, tasks.size)
    removed = tasks.delete_at(index - 1)
    puts "Задачу '#{removed}' видалено."
  else
    puts "Невірний номер задачі."
  end
  list_tasks(tasks)
end

# Основний цикл
loop do
  show_menu
  choice = gets.chomp

  case choice
  when "1"
    add_task(tasks)
  when "2"
    list_tasks(tasks)
  when "3"
    delete_task(tasks)
  when "4"
    puts "До побачення!"
    break
  else
    puts "Невідома опція. Спробуйте ще раз."
  end
end