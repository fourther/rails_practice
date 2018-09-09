class Program < ActiveRecord::Base
    has_many :entries, dependent: :destroy
    has_many :applicants, through: :entries, source: :customer
    belongs_to :registrant, class_name: 'StaffMember'

    scope :listing, -> {
        order(application_start_time: :desc)
        .includes(:registrant)
    }
end
