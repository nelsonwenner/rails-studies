# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create(
  {
    "description": "Bitcoin",
    "acronym": "BTC",
    "url_image": "https://cdn.pixabay.com/photo/2017/03/12/02/57/bitcoin-2136339_960_720.png"
  }
)

Coin.create(
  {
    "description": "Ethereum",
    "acronym": "ETH",
    "url_image": "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/116_Ethereum_logo_logos-512.png"
  }
)

Coin.create(
  {
    "description": "Dash",
    "acronym": "DASH",
    "url_image": "https://pngimage.net/wp-content/uploads/2018/05/dash-png-5.png"
  }
)