class Madlib < ApplicationRecord

    def blanks
        template.scan(/\[.*?\]/)
    end
end
