require "./Character.rb"
require "./brave.rb"
require "./monster.rb"

brave = Brave.new(name: "ウエゴン" ,hp:500 ,offense: 150 ,defense: 100)
monster = Monster.new(name: "雑草" ,hp: 250 ,offense: 200 ,defense: 100)

loop do
    brave.attack(monster)
    if monster.hp <=0
        exp = (monster.offense + monster.defense) * 2
        gold = (monster.offense + monster.defense) * 3
        puts "#{brave.name}はたたかいに勝った"
        puts "#{exp}の経験値と#{gold}ゴールドを獲得した"
        break
    end
    monster.attack(brave)
    if brave.hp <=0
        puts "#{brave.name}はたたかいに負けた"
        puts "目の前が真っ暗になった"
        break        
    end
end


