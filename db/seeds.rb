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

5.times do |index|
  Employee.create(
    :first_name => "Employee",
    :last_name => index + 1
  )
end

Category.all.each do |c|
  Manufacturer.all.each do |m|
    3.times do
      Device.create(
        name: "Device #{rand(1..100)}",
        category: c,
        manufacturer: m
      )
    end
  end
end

3.times do
  Employee.all.each do |e|
    device = Device.where(:employee_id => nil).sample
    device.employee = e
    device.save
  end
end

5.times do |index|
  Software.create(
    name: "Software #{index}",
    license_count: rand(1..5)
  )
end

3.times do
  Employee.all.each do |e|
    e.softwares << Software.all[rand(0..(Software.all.count - 1))]
  end
end
