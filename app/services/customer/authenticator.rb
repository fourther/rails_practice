class Customer::Authenticator
    def initialize(customer)
        @customer = customer
    end

    def authenticate(raw_password)
        @customer &&
            @customer.hashed_password &&
            BCrypt::Password.new(@customer.hashed_password) == raw_password #この==は比較演算子ではなくBCryptのメソッド。
            #raw_passwordをハッシュ関数で計算して、自身の保持しているハッシュ値と比較する
    end
end