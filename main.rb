require "./brave.rb"
require "./monster.rb"
require "./GamesController.rb"

games_controller = GamesController.new
brave = Brave.new(name: "ウエゴン" ,hp:500 ,offense: 150 ,defense: 100)
monster = Monster.new(name: "雑草" ,hp: 250 ,offense: 200 ,defense: 100)

games_controller.battle(brave: brave, monster: monster)

