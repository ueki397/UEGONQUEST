class Brave
    #書き換えられると困る項目はreaderにだけ定義する。
    attr_accessor :hp
    attr_reader :name, :offense, :defense
    SPECIAL_ATTACK_CONSTANT = 1.5

    # 引数に**を記述：ハッシュしか受け取れなくなる
    def initialize(**params)
        #各パラメータをハッシュで取得 Progateのrailsと使い方の比較をする。要調査。
        @name = params[:name]
        @hp = params[:hp]
        @offense = params[:offense]
        @defense = params[:defense]
    end


    def attack(monster)
        puts "#{@name}の攻撃！"
        attack_type = decision_attack_type
        damage = calculate_damage(attack_type: attack_type, target: monster)
        cause_damage(target: monster, damage: damage)
        puts "#{monster.name}の残りHPは#{monster.hp}だ。"
    end


    def cause_damage(**params)
        target = params[:target]
        damage = params[:damage]
        target.hp -= damage
        puts "#{target.name}は#{damage}のダメージを受けた。"
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
        attack_num = rand(4)
            if attack_num == 0
                puts "必殺攻撃！"
                "special_attack"
            else
                puts "通常攻撃"
                "nomal_attack"
            end
    end


    def calculate_special_attack
        @offense * SPECIAL_ATTACK_CONSTANT
    end
end


class Monster
    attr_accessor :hp, :name
    attr_reader :offense, :defense
    POWER_UP_RATE = 1.5
    HALF = 0.5
    def initialize(**params)
        @name = params[:name]
        @hp = params[:hp]
        @offense = params[:offense]
        @defense = params[:defense]
        @metamorphosis_flag = false
        @hp_half = params[:hp] * HALF
    end


    def attack(brave)
        puts "#{@name}の攻撃！"
            if @hp <= @hp_half && @metamorphosis_flag == false
                @metamorphosis_flag = true
                metamorphosis
            end
        damage = @offense - brave.defense
        brave.hp -= damage
        puts <<~EOS
        #{brave.name}は#{damage}のダメージを受けた
        #{brave.name}の残りHPは#{brave.hp}だ
        EOS
    end


    def metamorphosis
        metamorphosis_name = "ドラゴン"
        puts <<~EOS
        #{@name}は怒り狂っている
        #{@name}は変身して#{metamorphosis_name}になった！
        #{metamorphosis_name}の攻撃！
        EOS
        @name = metamorphosis_name
        @offense *= POWER_UP_RATE
    end
end


#インスタンス
brave = Brave.new(name: "ウエゴン" ,hp:500 ,offense: 150 ,defense: 100)
monster = Monster.new(name: "雑草" ,hp: 250 ,offense: 200 ,defense: 100)


brave.attack(monster)
monster.attack(brave)


