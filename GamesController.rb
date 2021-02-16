class GamesController
    Exp_constant = 2
    Gold_constant = 3


    def battle(**params)
        brave = params[:brave]
        monster = params[:monster]
        loop do
            brave.attack(monster)
            break if batlle_end?(monster)
            monster.attack(brave)
            break if batlle_end?(brave)
        end
        if battle_result(brave)
            result = calculate_of_exp_and_gold(monster)
            puts "#{brave.name}はたたかいに勝った"
            puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
        else
            puts "#{brave.name}はたたかいに負けた"
            puts "目の前が真っ暗になった"
        end
    end


    def batlle_end?(target)
        target.hp <= 0
    end


    def battle_result(brave)
        brave.hp >0
    end


    def calculate_of_exp_and_gold(monster)
        exp = (monster.offense + monster.defense) * Exp_constant
        gold = (monster.offense + monster.defense) * Gold_constant
        result = {exp: exp, gold: gold}
        result
    end
end


