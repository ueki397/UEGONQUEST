require "./Character.rb"

class Monster < Character
    POWER_UP_RATE = 1.5
    HALF = 0.5

    def initialize(**params)
        super(
            name: params[:name],
            hp: params[:hp],
            offense: params[:offense],
            defense: params[:defense]
        )
        @metamorphosis_flag = false
        @hp_half = params[:hp] * HALF
    end


    def attack(brave)
        judge_metamorphosis
        damage = calculate_damage(brave)
        cause_damage(target: brave, damage: damage)
        attack_message
        damage_message(target: brave, damage: damage)
    end


    def judge_metamorphosis
        if @hp <= @hp_half && @metamorphosis_flag == false
            @metamorphosis_flag = true
            metamorphosis_name = "ドラゴン"
            @offense *= POWER_UP_RATE
            metamorphosis_message(metamorphosis_name)
            @name = metamorphosis_name
        end
    end


    def calculate_damage(target)
            @offense - target.defense
    end


    def cause_damage(**params)
        target = params[:target]
        damage = params[:damage]
        target.hp -= damage
        target.hp =0 if target.hp < 0
    end
end

