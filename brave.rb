require "./Character.rb"

class Brave < Character
    SPECIAL_ATTACK_CONSTANT = 1.5

    def attack(monster)
        attack_type = decision_attack_type
        damage = calculate_damage(attack_type: attack_type, target: monster)
        cause_damage(target: monster, damage: damage)
        attack_message(attack_type: attack_type)
        damage_message(target: monster, damage: damage)
    end


    def cause_damage(**params)
        target = params[:target]
        damage = params[:damage]
        target.hp -= damage
        target.hp =0 if target.hp < 0
    end



    def calculate_damage(**params)
        target = params[:target]
        attack_type = params[:attack_type]
        if attack_type == "special_attack"
            calculate_special_attack - target.defense
        else
            @offense - target.defense
        end
    end


    def decision_attack_type
        #1/5の確率でスペシャルアタック
        attack_num = rand(4)
            if attack_num == 0
                "special_attack"
            else
                "nomal_attack"
            end
    end


    def calculate_special_attack
        @offense * SPECIAL_ATTACK_CONSTANT
    end
end