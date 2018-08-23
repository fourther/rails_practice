class Admin::Authenticator
    def initialize(administrator)
        @administrator = administrator
    end

    def authenticate(raw_password)
        @administrator &&
            @administrator.hashed_password &&
            BCrypt::Password.new(@administrator.hashed_password) == raw_password #この==は比較演算子ではなくBCryptのメソッド。
            #raw_passwordをハッシュ関数で計算して、自身の保持しているハッシュ値と比較する
    end
end