class StaffMemberPresenter < ModelPresenter
    delegate :suspended?, :family_name, :given_name, :family_name_kana, :given_name_kana, to: :object

    def suspended_mark
        suspended? ? raw('&#x2611') :
            raw('&#x2610;')
    end

    def full_name
        markup(:td) do |m|
            m.text family_name
            m.text " "
            m.text given_name
        end
        # family_name given_name
        # markup(:div, class: 'input-block') do |m|
        #     m << decorated_label(name1, label_text, options)
        #     m << text_field(name1, options)
        #     m << text_field(name2, options)
        #     m << error_messages_for(name1)
        #     m << error_messages_for(name2)
        # end
    end

    def full_name_kana
        markup(:td) do |m|
            m.text family_name_kana
            m.text " "
            m.text given_name_kana
        end
    end
end