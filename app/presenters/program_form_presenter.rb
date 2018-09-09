class ProgramFormPresenter < FormPresenter
    def description
        markup(:div, class: 'input-block') do |m|
            m << decorated_label(:description, '詳細', required: true)
            m << text_area(:description, rows: 6, style: 'width: 454px')
            m.span '(800文字以内)', class: 'instruction', style: 'float:right'
        end
    end


    def datetime_field_block(name, label_text, options = {})
        instruction = options.delete(:instruction)
        markup(:div, class: 'input-block') do |m|
            m << decorated_label("#{name}_date", label_text, options)
            if options[:class].kind_of?(String)
                classes = options[:class].strip.split + ['datepicker']
                options[:class] = classes.uniq.join(' ')

            else
                options[:class] = 'datepicker'
            end
            m << text_field("#{name}_date", options)
            m << form_builder.select("#{name}_hour", ('00'..'23').to_a)
            m << ':'
            m << form_builder.select("#{name}_minute", ('00'..'59').to_a)
            m.span "(#{instruction})", class: 'instruction' if instruction
        end
    end
end