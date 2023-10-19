# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create(
  [
    { name: "Smart Phone" },
    { name: "Laptop" },
    { name: "Desktop" }
  ]
)

Manufacturer.create(
  [
    { name: "Apple", website: "https://www.apple.com" },
    { name: "Lenovo", website: "https://www.lenovo.com" },
    { name: "Dell", website: "https://www.dell.com" },
  ]
)

#Employee.create(
#  [
#    { first_name: "John", last_name: "Doe" },
#    { first_name: "Jill", last_name: "Doe" },
#    { first_name: "James", last_name: "Doe" },
#    { first_name: "Jane", last_name: "Doe" },
#  ]
#)

5.times do |index|
  Employee.create(
    :first_name => "Employee",
    :last_name => index
  )
end

Employee.all.each do |employee|
  Device.create!([
    { name: "Smart Phone #{employee.id}", manufacturer: Manufacturer.first, category: Category.first },
    { name: "Laptop #{employee.id}", manufacturer: Manufacturer.offset(1).first, category: Category.offset(1).first },
  ])
end

#Software.create(
#  [
#    { name: "Microsoft Windows", :license_count => 2 },
#    { name: "Microsoft Office", :license_count => 2 },
#    { name: "Dropbox", :license_count => 5 },
#    { name: "Gmail", :license_count => 5 },
#  ]
#)

5.times do |index|
  Software.create(
    name: "Software #{index}",
    license_count: rand(1..5)
  )
end

3.times do
  Employee.all.each do |e|
  # if Device.where(employee: nil).present?
  #   e.devices << Device.where(employee: nil)[rand(0..(Device.where(employee: nil).count - 1))]
  # end
    e.softwares << Software.all[rand(0..(Software.all.count - 1))]
  end
end
