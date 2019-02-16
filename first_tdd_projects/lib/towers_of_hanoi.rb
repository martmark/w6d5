class Tower
    attr_accessor :towers

    def initialize(n = 4)
        @towers = Array.new(3){[]}
        @towers[0] = (1..n).to_a
    end

    def move(start_tower, end_tower)
        unless (1..3).include?(start_tower) && (1..3).include?(end_tower)
            raise "Tower selected is invalid!"
        end

        raise "Tower is empty!" if towers[start_tower-1].empty?

        if !towers[end_tower -1].empty? && (towers[end_tower - 1][0] < towers[start_tower-1][0])
            raise "Cannot move to smaller disk!" 
        end
        
        moving_piece = towers[start_tower-1].shift
        towers[end_tower-1].unshift(moving_piece)
    end

    def won?
        towers[0].empty? && towers[1].empty?
    end
end