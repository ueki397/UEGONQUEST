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
        puts "#{@name}の攻撃！"
        judge_metamorphosis
        calculate_damage
        cause_damage(target: brave)
        brave.hp =0 if brave.hp < 0
        puts "#{brave.name}の残りHPは#{brave.hp}だ"
    end


    def judge_metamorphosis
        if @hp <= @hp_half && @metamorphosis_flag == false
            @metamorphosis_flag = true
            metamorphosis_name = "ドラゴン"
            puts <<~EOS
            #{@name}は怒り狂っている
            #{@name}は変身して#{metamorphosis_name}になった！
            EOS
            @name = metamorphosis_name
        end
    end


    def calculate_damage
        puts "#{@name}の攻撃！"
        if @metamorphosis_flag == true
            @offense *= POWER_UP_RATE
        end
    end


    def cause_damage(**params)
        target = params[:target]
        damage = @offense - target.defense
        target.hp -= damage
        puts "#{target.name}は#{damage}のダメージを受けた"
    end
end

