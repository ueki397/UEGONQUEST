class Character
    #書き換えられると困る項目はreaderにだけ定義する。
    attr_accessor :hp, :name
    attr_reader :offense, :defense
    # 引数に**を記述：ハッシュしか受け取れなくなる
    def initialize(**params)
        #各パラメータをハッシュで取得 Progateのrailsと使い方の比較をする。要調査。
        @name = params[:name]
        @hp = params[:hp]
        @offense = params[:offense]
        @defense = params[:defense]
    end
end
