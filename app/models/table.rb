class Table < ApplicationRecord
    validates :list, presence: true
    validate :list_size,

    def list_size
        if list.split(', ').length > 100 || list.split(', ').length < 1
          errors.add(:list_length, "can't be longer than 100 letters")
        end
    end

    def column_order
        array = list.split(', ')
        length = array.length
        remainder = length % columns
        rows = (length/columns.to_f).ceil
        table = []

        rows.times do |row|
           subarray = Array.new(columns)
           count = 0
            array.each_with_index do |letter, index|
                break if index >= columns
                # breaks when reaches last letter on last letter
                break if row == rows-1 && (index >=  remainder && remainder != 0)
                if index < remainder || remainder == 0
                    i = index*rows + row
                else
                    i = index*rows + row - count
                    count+=1
                end
                subarray[index] = array[i]
            end
            table << subarray
        end
        table
    end
end
