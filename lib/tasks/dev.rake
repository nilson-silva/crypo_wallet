namespace :dev do
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
       if Rails.env.development?
         show_spinner("Apagando BD...") { %x(rails db:drop)}
         show_spinner("Criando BD...") { %x(rails db:create)}
         show_spinner("Migrando BD...") { %x(rails db:migrate)}
         %x(rails dev:add_mining_types)
         %x(rails dev:add_coins)
       else
         puts "Voce esta em ambiente de desenvolvimento!"
       end  
    end 
  
    desc "Cadastra as moedas"
    task add_coins: :environment do 
        show_spinner("cadastrando moedas...") do 
          coins = [
                  {
                    description: "Bitcoin",
                    acronym: "BTC",
                    url_image:"https://img2.gratispng.com/20171220/bhe/bitcoin-png-5a3a2702388611.73714972151376051423153857.jpg",
                    mining_type: MiningType.find_by(acronym: 'PoW')
                  },
                  {     
                    description: "Ethereum",
                    acronym: "ETH",
                    url_image: "https://img1.gratispng.com/20180516/ouw/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9b20d86.8643914515265041217293.jpg", 
                    mining_type: MiningType.all.sample
                  },
                  {
                    description: "DASH",
                    acronym: "DASH",
                    url_image:"https://cdn1.vectorstock.com/i/1000x1000/71/25/dash-coin-icon-vector-19477125.jpg",
                    mining_type: MiningType.all.sample
                  },
                  {
                    description: "Iota",
                    acronym: "IOT",
                    url_image:"https://assets.stickpng.com/images/5a5223802f93c7a8d5137fe2.png",
                    mining_type: MiningType.all.sample  
                  },
                  {
                    description: "ZCash",
                    acronym: "ZEC",
                    url_image:"https://z.cash/wp-content/uploads/2020/03/zcash-logo-vertical-fullcolor.png",
                    mining_type: MiningType.all.sample
                  }
                ]
          coins.each do |coin|
            Coin.find_or_create_by!(coin)
          end 
        end
    end   
  
    desc "Cadastro dos tipos de mineração"
      task add_mining_types: :environment do 
        show_spinner("Cadastrando tipos de mineração...")do 
          mining_types = [
           {description: "Proof of Work", acronym: "PoW"},
           {description: "Proof Stake", acronym: "PoS"},
           {description: "Proof of Capacity", acronym:"PoC"},
        ]
  
         mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
       end 
     end 
  end 
  
   private
  
   def show_spinner(msg_start, msg_end = "concluido!")
         spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
         spinner.auto_spin
         yield
         spinner.success("(#{msg_end})")    
  
       end
   end   
  
  