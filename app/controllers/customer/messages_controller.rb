class Customer::MessagesController < Customer::Base
    def index
        @messages = StaffMessage.where(deleted: false)
        @messages = @messages.where('customer' => current_customer.id).page(params[:page])
        # @messages = @messages.where('message_tag_links.tag_id' => params[:tag_id])
    end

    def show
        @message = StaffMessage.find(params[:id])
    end

    def destroy
        message = StaffMessage.find(params[:id])
        message.update_column(:deleted, true)
        flash.notice = '問い合わせを削除しました'
        redirect_to :back
    end

    def new
        @message = CustomerMessage.new
    end

    def confirm
        @message = CustomerMessage.new(customer_message_params)
        if @message.valid?
            render action: 'confirm'
        else
            flash.now.alert = '入力に誤りがあります'
            render action: 'new'
        end
    end

    def create
        @message = CustomerMessage.new(customer_message_params)
        if params[:commit]
            @message.customer = current_customer
            # @message.discarded = false
            # @message.deleted = false
            if @message.save
                flash.notice = '問い合わせを送信しました'
                redirect_to :customer_root
            else
                flash.now.alert = '入力に誤りがあります'
                render action: 'new'
            end
        else
            render action: 'new'
        end
    end

    private

    def customer_message_params
        params.require(:customer_message).permit(:subject, :body)
    end
end
