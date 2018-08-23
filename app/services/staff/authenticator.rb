class Staff::Authenticator
    def initialize(staff_member)
        @staff_member = staff_member
    end

    def authenticate(raw_password)
        @staff_member &&
            # !@staff_member.suspended? &&
            @staff_member.hashed_password &&
            @staff_member.start_date <= Date.today &&
            (@staff_member.end_date.nil? || @staff_member.end_date > Date.today) &&
            BCrypt::Password.new(@staff_member.hashed_password) == raw_password #この==は比較演算子ではなくBCryptのメソッド。
            #raw_passwordをハッシュ関数で計算して、自身の保持しているハッシュ値と比較する
    end
end