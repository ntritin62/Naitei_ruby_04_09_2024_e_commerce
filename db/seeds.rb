User.create! user_name: "admin",
             email: "admin@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             role: 1,
             activated: true,
             activated_at: Time.zone.now

User.create! user_name: "tin",
             email: "tin@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             activated: true,
             activated_at: Time.zone.now

User.create! user_name: "tin",
             email: "tin123@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             activated: true,
             activated_at: Time.zone.now

20.times do
  Address.create!(
    user: User.second,
    receiver_name: Faker::Name.name,
    place: Faker::Address.full_address,
    phone: Faker::Number.number(digits: 10)
  )
end

fiction = Category.create!(name: "Fiction")
non_fiction = Category.create!(name: "Non-Fiction")
fantasy = Category.create!(name: "Fantasy")
mystery = Category.create!(name: "Mystery")
science_fiction = Category.create!(name: "Science Fiction")

require "open-uri"

fiction = Category.find_or_create_by!(name: "Fiction")
non_fiction = Category.find_or_create_by!(name: "Non-fiction")
fantasy = Category.find_or_create_by!(name: "Fantasy")
mystery = Category.find_or_create_by!(name: "Mystery")
science_fiction = Category.find_or_create_by!(name: "Science Fiction")

products = [
  {
    name: "Cuộc sống kỳ diệu của A. J. Fikry",
    desc: "Một tiểu thuyết về tình yêu, gia đình và sức mạnh của sách.",
    price: 100000,
    stock: 50,
    rating: 4.2,
    category: fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Giết con chim nhại",
    desc: "Một tiểu thuyết của Harper Lee, xuất bản năm 1960.",
    price: 79000,
    stock: 30,
    rating: 4.8,
    category: fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "1984",
    desc: "Một tiểu thuyết chống utopia của George Orwell, xuất bản năm 1949.",
    price: 89000,
    stock: 40,
    rating: 4.6,
    category: fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Nhà giả kim",
    desc: "Một tiểu thuyết nổi tiếng của Paulo Coelho, nói về hành trình tìm kiếm giấc mơ.",
    price: 95000,
    stock: 40,
    rating: 4.8,
    category: fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Bên dòng sông Piedra tôi ngồi và khóc",
    desc: "Một cuốn tiểu thuyết của Paulo Coelho về tình yêu và niềm tin.",
    price: 87000,
    stock: 35,
    rating: 4.3,
    category: fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Sapiens: Lược sử loài người",
    desc: "Một cuốn sách phi hư cấu của Yuval Noah Harari.",
    price: 129000,
    stock: 20,
    rating: 4.7,
    category: non_fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Học để thay đổi",
    desc: "Một hồi ký của Tara Westover.",
    price: 99000,
    stock: 15,
    rating: 4.6,
    category: non_fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Khi hơi thở hóa thinh không",
    desc: "Một hồi ký về cuộc sống của Paul Kalanithi.",
    price: 110000,
    stock: 25,
    rating: 4.5,
    category: non_fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Từ tốt đến vĩ đại",
    desc: "Một cuốn sách về quản lý và lãnh đạo của Jim Collins.",
    price: 105000,
    stock: 20,
    rating: 4.4,
    category: non_fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Bí mật tư duy triệu phú",
    desc: "Cuốn sách của T. Harv Eker khám phá cách tư duy để thành công về tài chính.",
    price: 85000,
    stock: 30,
    rating: 4.6,
    category: non_fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Harry Potter và Hòn đá phù thủy",
    desc: "Cuốn sách đầu tiên trong loạt truyện Harry Potter của J.K. Rowling.",
    price: 95000,
    stock: 60,
    rating: 4.9,
    category: fantasy,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Chúa tể những chiếc nhẫn: Fellowship of the Ring",
    desc: "Cuốn đầu tiên trong bộ truyện Chúa tể những chiếc nhẫn của J.R.R. Tolkien.",
    price: 120000,
    stock: 40,
    rating: 4.8,
    category: fantasy,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Đứa trẻ mang ngọn lửa",
    desc: "Một cuốn sách về cuộc phiêu lưu của một cậu bé trong thế giới phép thuật.",
    price: 98000,
    stock: 45,
    rating: 4.7,
    category: fantasy,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Cuộc sống trong tay kẻ giết người",
    desc: "Một cuốn tiểu thuyết trinh thám đầy ly kỳ.",
    price: 87000,
    stock: 25,
    rating: 4.4,
    category: mystery,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Cô gái mất tích",
    desc: "Một câu chuyện về sự mất tích và những bí ẩn xung quanh nó.",
    price: 103000,
    stock: 20,
    rating: 4.5,
    category: mystery,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Ánh trăng mờ",
    desc: "Một cuốn tiểu thuyết trinh thám với những tình tiết bất ngờ.",
    price: 92000,
    stock: 30,
    rating: 4.6,
    category: mystery,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Dune",
    desc: "Một cuốn tiểu thuyết khoa học viễn tưởng nổi tiếng của Frank Herbert.",
    price: 115000,
    stock: 22,
    rating: 4.7,
    category: science_fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  },
  {
    name: "Lịch sử tương lai",
    desc: "Một cuốn sách về khoa học viễn tưởng và những khả năng tương lai.",
    price: 99000,
    stock: 28,
    rating: 4.5,
    category: science_fiction,
    image_url: "https://positivepurchasing.com/wp-content/uploads/2024/05/Category-Management-5th-ed-Book-on-table-on-slate-grey-background-for-Linktree-800x450.jpg"
  }
]

products.each do |product_data|
  product = Product.create!(
    name: product_data[:name],
    desc: product_data[:desc],
    price: product_data[:price],
    stock: product_data[:stock],
    rating: product_data[:rating],
    category: product_data[:category]
  )

  downloaded_image = URI.open(product_data[:image_url])
  product.image.attach(io: downloaded_image, filename: "#{product_data[:name].parameterize}_image.jpg", content_type: "image/jpeg")
end

