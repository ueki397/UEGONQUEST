class GamesController
    Exp_constant = 2
    Gold_constant = 3

    include MessageDialog

    def battle(**params)
        build_characters(params)
        loop do
            @brave.attack(@monster)
            break if batlle_end?
            @monster.attack(@brave)
            break if batlle_end?
        end
        batlle_judgement
    end


        def build_characters(**params)
            @brave = params[:brave]
            @monster = params[:monster]
        end


        def batlle_judgement
            result = calculate_of_exp_and_gold
            end_message(result)
        end


    def batlle_end?
        @monster.hp <= 0 || @brave.hp <= 0 
    end


    def brave_win?
        @brave.hp >0
    end


    def calculate_of_exp_and_gold
        if brave_win?
            brave_win_flag = true
            exp = (@monster.offense + @monster.defense) * Exp_constant
            gold = (@monster.offense + @monster.defense) * Gold_constant
        else
            brave_win_flag = false
            exp = 0
            gold = 0
        end
        {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
    end
end