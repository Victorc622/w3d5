require "byebug"
class KnightPathFinder
    def initialize(pos)
        @pos = pos
        @considered_positions = [pos]
    end

    attr_accessor :considered_positions, :pos

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

    def new_move_positions
        return_array =[]
        all_pos = KnightPathFinder.valid_moves(@pos)
        all_pos.each do |potential_position|
            if !@considered_positions.include?(potential_position)
             
                @considered_positions << potential_position
                debugger
                return_array << potential_position

            end
        end
        return return_array
    end

    def build_move_tree

        q = [KnightPathFinder.new(@pos)]
        
        until q.empty?
         
            front_node = q.shift
            new_moves = front_node.new_move_positions
            debugger
            new_moves.each do |new_pos|
                 q << KnightPathFinder.new(new_pos) unless new_pos == front_node.pos
            end
        end
    end

    def inspect
        @pos
    end

end