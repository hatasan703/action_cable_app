User.create!(
  email: 'admin@gmail.com',
  password: 'hogehoge'
)


5.times do |n|
  Spot.create!(
    title: "これはタイトルです#{n}",
    description: "これはテキストですこれはテキストですこれはテキストですこれはテキストですこれはテキストです"
  )
end