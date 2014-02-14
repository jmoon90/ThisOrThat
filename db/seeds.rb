require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

csv_text = File.read("db/seed_data.csv")
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  info = row.to_hash
  question = Question.create!(description: "#{info["Question"]}")
  Status.create!(question_id: question.id, approved: "#{info["approved"]}")
  question.save
  option1 = Option.create!(description: "#{info["Option1"]}", question_id: question.id)
  option2 = Option.create!(description: "#{info["Option2"]}", question_id: question.id)
  option1.save
  option2.save
end
