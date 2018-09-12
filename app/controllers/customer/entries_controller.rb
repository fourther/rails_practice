class Customer::EntriesController < Customer::Base
    def create
        program = Program.published.find(params[:program_id])
        if max = program.max_number_of_participants
            if program.entries.where(canceled: false).count < max
                program.entries.create!(customer: current_customer)
                flash.notice = 'プログラムに申し込みました'
            else
                flash.alert = 'プログラムへの申し込み者数が上限に達しました'
            end
        else
            program.entries.create!(customer: current_customer)
            flash.notice = 'プログラムに申し込みました'
        end
        redirect_to [ :customer, program ]
    end
end
