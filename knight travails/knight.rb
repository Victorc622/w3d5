class KnightPathFinder
    def initialize(pos)
        @pos = pos
    end
    def self.valid_moves(pos)
        arr = []
        move_1 = [pos[0] + 1, pos[1] + 2]
        arr << move_1 if move_1.all?{ |number| number >= 0 && number < 8}
        move_2 = [pos[0] + 2, pos[1] + 1]
        arr << move_2 if move_2.all?{ |number| number >= 0 && number < 8}
        move_3 = [pos[0] - 1 , pos[1] - 2]
        arr << move_3 if move_3.all?{ |number| number >= 0 && number < 8}
        move_4 = [pos[0] - 2, pos[1] - 1]
        arr << move_4 if move_4.all?{ |number| number >= 0 && number < 8}
        move_5 = [pos[0] + 1, pos[1] - 2]
        arr << move_5 if move_5.all?{ |number| number >= 0 && number < 8}
        move_6 = [pos[0] + 2, pos[1] - 1]
        arr << move_6 if move_6.all?{ |number| number >= 0 && number < 8}
        move_7 = [pos[0] - 1, pos[1] + 2]
        arr << move_7 if move_7.all?{ |number| number >= 0 && number < 8}
        move_8 = [pos[0] - 2, pos[1] + 1]
        arr << move_8 if move_8.all?{ |number| number >= 0 && number < 8}

        return arr
    end
end