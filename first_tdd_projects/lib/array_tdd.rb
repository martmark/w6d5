class Array

    def my_uniq
        hash = {}
        self.each{|e| hash[e] = true}
        hash.keys
    end

    def two_sum
        arr = []
            (0...self.length-1).each do |i|
                x = i+1
                while x < self.length
                    arr << [i,x] if self[i]+self[x] == 0
                    x += 1
                end
            end
        arr
    end

    # def my_transpose
    #     arr = []
    #         (0...self.length).each do |i|
    #             sub_arr = []
    #             (0...self.length).each do |x|
    #                sub_arr << self[x][i]
    #             end
    #             arr << sub_arr    
    #         end
    #     arr
    # end

    def my_transpose
        arr = []
            (0...self.length).each do |i|
                (0...self.length).each do |j|
                    if j == 0
                        arr << [self[j][i]] 
                    else
                        arr[i] << self[j][i]
                    end
                end
            end
        arr
    end

    def stock_picker
        hash = Hash.new(0)
        (0...self.length-1).each do |i|
            (i+1...self.length).each do |x|
                hash[[i,x]] = self[x]-self[i]
            end
        end
        hash.key(hash.values.max)
    end

end