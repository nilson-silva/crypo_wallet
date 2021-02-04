# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image:https://lh3.googleusercontent.com/proxy/YBDgIXqiiu5eoRuCDKOB7gRHTu9iEotsUE1-KJglZqw4t7iYeWLoEX3jXeCqbHSuqtOwG7fVr__0dh_N-1Dcj9zsXuj0uZbvekciYp0mkajRu4lPQyY
)
(
    Coin.create!(
        description: "Ethereum",
        acronym: "ETH",
        url_image:https://image.shutterstock.com/image-vector/ethereum-eth-vector-icon-isolated-260nw-1012057756.jpg
    ) 
)
(
    Coin.create!(
        description: "DASH",
        acronym: "DASH",
        url_image:
    ) 
)