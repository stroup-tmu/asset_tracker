# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create(
  [
    { name: "Desktop" },
    { name: "Laptop" },
    { name: "Smart Phone" }
  ]
)

Manufacturer.create(
  [
    { name: "Apple" },
    { name: "Dell" },
    { name: "Lenovo" },
    { name: "Microsoft" },
    { name: "Samsung" }
  ]
)

2.times do |i|
  n = i + 1
  Device.create!(
    [
      { name: "iPhone #{n}", manufacturer: Manufacturer.find_by(name: "Apple"), category: Category.find_by(name: "Smart Phone") },
      { name: "Dell Inspiron #{n}", manufacturer: Manufacturer.find_by(name: "Dell"), category: Category.find_by(name: "Desktop") },
      { name: "Lenovo Thinkpad #{n}", manufacturer: Manufacturer.find_by(name: "Lenovo"), category: Category.find_by(name: "Laptop") },
      { name: "Samsung Galaxy #{n}", manufacturer: Manufacturer.find_by(name: "Samsung"), category: Category.find_by(name: "Smart Phone") }
    ]
  )
end

Software.create(
  [
    { name: "Microsoft Windows", :license_count => 2 },
    { name: "Microsoft Office", :license_count => 2 },
    { name: "Dropbox", :license_count => 5 },
    { name: "Gmail", :license_count => 5 },
  ]
)

Employee.create(
  [
    { first_name: "John", last_name: "Doe" },
    { first_name: "Jill", last_name: "Doe" },
    { first_name: "James", last_name: "Doe" },
    { first_name: "Jane", last_name: "Doe" },
  ]
)

2.times do
  Employee.all.each do |e|
    if Device.where(employee: nil).present?
      e.devices << Device.where(employee: nil)[rand(0..(Device.where(employee: nil).count - 1))]
    end
    e.softwares << Software.all[rand(0..(Software.all.count - 1))]
  end
end
