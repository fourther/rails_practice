class Staff::PasswordsController < Staff::Base
    def show
        redirecto_to :edit_staff_password
    end

    def edit
        @change_password_form =
            Staff::ChangePasswordForm.new(object: current_staff_member)
    end

    def update
        @change_password_form = Staff::ChangePasswordForm.new(staff_member_params)
        @change_password_form.object = current_staff_member
    end
end
