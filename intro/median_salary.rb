incomes = []

100.times do
  incomes.push(rand(999))
end

incomes.sort!
median = incomes.at(incomes.size / 2)

puts "Salaries #{incomes}"
puts "Median = #{median}"
