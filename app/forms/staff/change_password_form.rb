class Staff::ChangePasswordForm
    include ActiveModel::Model

    attr_accessor :object, :curernt_password, :new_password,
                  :new_password_confirmation

    def save
        object.password = new_password
        object.save!
    end
end